<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Mail\Mailer;
use DB;
use Session;
use Input;
use Redirect;
use Mail;

class AuthenticationModel extends Model
{
    //

    public static function AuthenticateAdmin($email, $password){
      //Check the user present or not from database.
      $md5=md5($password);
      $valid_user=DB::table('admin')->where('email',$email)->where("password",$md5)->count();
      $account_active=DB::table('admin')->where('email',$email)->where("password",$md5)->where('acount_active',1)->count();
      if($valid_user && $account_active){
        $admin_data=DB::table('admin')->where('email',$email)->where("password",$md5)->first();
        $update_details=array();
        $update_details['last_login']=date("Y-m-d H:i:s",time());
        DB::table('admin')->where('email',$email)->where("password",$md5)->update($update_details);
        $admin_data=array($admin_data);
        foreach($admin_data as $key=>$value):
          Session::put($key,$value);
        endforeach;

        Session::save();

      }
      else if($valid_user && !$account_active){
           Session::put('system_message','Your account is not activated yet !');
           Session::put('system_message_type','danger');
      }
      else{
        Session::put('system_message','Entered Credentials are not matching, please enter the correct ones !');
        Session::put('system_message_type','danger');
      }
      return $account_active;
    }

    public static function AuthenticateSystemAdmin(){
      $authenticate_admin_email=Input::input('authenticate_admin_email');
      $valid_admin=DB::table('admin')->where('email',$authenticate_admin_email)->count();
      if($valid_admin){
        $admin_data=DB::table('admin')->where('email',$authenticate_admin_email)->first();
        $authentication_string=$admin_data->email."|".(time()+(5*60))."|".$admin_data->admin_id;
        $authentication_string=str_replace("=","",base64_encode($authentication_string));
        $message="<div style='background:#123456;color:white;padding: 20px;font-family: arial;line-height:25px'>";
        $message.="Hello {$admin_data->display_name},<br>";
        $message.="Please click on the reset link given below to reset the administrator password, this link will expire after 5 minutes.<br>";
        $reset_link=url("reset-admin-password/$authentication_string");
        $message.="<a href='$reset_link'>Reset Link</a><br><br>Thank you :)<br>StarsApp Team";
        $message.="<div>";
        
        // Mail::raw('StarsApp Admin Password Reset', function($message)
        // {
        //     $message->from('tporter@appddictionstudio.com', 'StarsApp');

        //     $message->to('doru.arfire.1279@gmail.com');

        // });

        $to=$authenticate_admin_email;
        $subject="StarsApp Password Reset";
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        // More headers
        $headers .= 'From: StarsApp<starsapp@appddictionstudio.com>' . "\r\n";
        @mail($to,$subject,$message,$headers);

        Session::put('system_message','Match Found, A further mail has been sent to your mail with password reset instructions !');
        Session::put('system_message_type','success');
      }
      else{
        Session::put('system_message','Entered Credentials are not matching, please enter the correct admin email id to move further!');
        Session::put('system_message_type','danger');
      }
    }



    public static function checkAuthenticationString($authentication_string){
      $auth_string=base64_decode($authentication_string);
      $auth_arr=@explode("|",$auth_string);
      $admin_email=$auth_arr[0];
      $admin_id=$auth_arr[2];
      $valid_admin=DB::table('admin')->where('email',$admin_email)->where('admin_id',$admin_id)->count();
      if(!$valid_admin){
        Session::put('system_message','Entered Credentials are not matching,seems like the credentials are tampered');
        Session::put('system_message_type','danger');
       return 0;
      }
      else if(intval(time()) > intval($auth_arr[1])){
        Session::put('system_message','This link has been expired, the validity of the reset password link is 5 minutes only! ');
        Session::put('system_message_type','danger');
      return 0;
      }
      else{
        return 1;
      }
    }

public static function setRegistrationCookie(){
          setcookie("reg_display_name",Input::get('display_name'),time()+60);
          setcookie("reg_email",Input::get('admin_email'),time()+60);
          setcookie("reg_redirection",Input::get('redirection'),time()+60);
}

public static function eraseRegistrationCookie(){
          setcookie("reg_display_name",Input::get('display_name'),time()-60);
          setcookie("reg_email",Input::get('admin_email'),time()-60);
          setcookie("reg_redirection",Input::get('redirection'),time()-60);
}

    public static function createAdminUser(){

      //First Check this user is exist then check password are matching or not.
      $user_exists=DB::table('admin')->where('email',Input::get('admin_email'))->count();

          if($user_exists){
            Session::put('system_message','This email id already registered with your system !');
            Session::put('system_message_type','danger');
            self::setRegistrationCookie();
            return 0;
          }
          else if(Input::get('admin_password')!=Input::get('confirm_admin_password')){
            Session::put('system_message','Entered passwords are not matching !');
            Session::put('system_message_type','danger');
            self::setRegistrationCookie();
            return 0;
          }
          else{
          self::eraseRegistrationCookie();
                  try{
                     $details=array();
                      $details['display_name']=Input::get('display_name');
                      $details['password']=md5(Input::get('admin_password'));
                      $details['email']=Input::get('admin_email');
                      $details['redirection']=Input::get('redirection');
                      $details['acount_active']=0;
                      $details['last_login']=date("Y-m-d H:i:s",time());

                      DB::table('admin')->insert($details);

                      $to=Input::get('admin_email');
                      $subject="StarsApp Registration Successful";
                      $headers = "MIME-Version: 1.0" . "\r\n";
                      $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                      // More headers
                      $headers .= 'From: StarsApp<starsapp@appddictionstudio.com>' . "\r\n";

                      $message="<div style='border-radius:4px;background:#123456;color:white;padding: 20px;font-family: arial;line-height:25px'>";
                      $message.="Hello {$details['display_name']},<br>";
                      $message.="Your account has been successfully created in the StarsApp, Please click on the activation link given below to proceed further.<br>";
                      $account_activation_link=url("activate-admin-account/".str_replace("=","",base64_encode($details['email'])));
                      $message.="<a href='$account_activation_link'>Activation Link</a><br><br>Thank you :)<br>StarsApp Team";
                      $message.="<div>";

                      @mail($to,$subject,$message,$headers);

                      Session::put('system_message','Registration Successful, A mail has been sent to your email inbox with account activation link !');
                      Session::put('system_message_type','success');


                  } catch (\Illuminate\Database\QueryException $e) {
                      Session::put('system_message',$e->getMessage());
                      Session::put('system_message_type','danger');
                  } catch (\Exception $e) {
                      Session::put('system_message',$e->getMessage());
                      Session::put('system_message_type','danger');
                  }
          }
    }

    public static function activateAdminAccount($encoded_email){
                    try{
                      $details=array();
                      $details['acount_active']=1;
                      $admin_email=base64_decode($encoded_email);
                      DB::table('admin')->where('email',$admin_email)->update($details);
                      Session::put('system_message','Your account has been activated, you can login now using your entered credentials !');
                      Session::put('system_message_type','success');


                  } catch (\Illuminate\Database\QueryException $e) {
                      Session::put('system_message',$e->getMessage());
                      Session::put('system_message_type','danger');
                  } catch (\Exception $e) {
                      Session::put('system_message',$e->getMessage());
                      Session::put('system_message_type','danger');
                  }
    } 

    public static function resetAdminPasswordDetails(){
      $rp1=Input::get('reset_password1');
      $rp2=Input::get('reset_password2');
      $authentication_string=Input::get('authentication_string');
      $auth_string=base64_decode($authentication_string);
      $auth_arr=@explode("|",$auth_string);
      $admin_email=$auth_arr[0];
      
      if($rp1==$rp2 && !empty($rp1) && !empty($rp2)){
         $details=array();
         $details['password']=md5($rp1);
         $details['acount_active']=1;
         DB::table('admin')->where('email',$admin_email)->update($details);
         Session::put('system_message','The admin password has been successfully reset, Now you can login to the system administration panel!');
         Session::put('system_message_type','success');
         redirector('/login');
      }
      else{
           Session::put('system_message','The entered password are not matching !');
           Session::put('system_message_type','danger');
           $reset_link="/reset-admin-password/$authentication_string";
           redirector($reset_link);
      }

    }

} //Class Ends Here
