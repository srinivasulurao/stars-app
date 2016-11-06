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
      if($valid_user){
        $admin_data=DB::table('admin')->where('email',$email)->where("password",$md5)->first();
        $admin_data=array($admin_data);
        foreach($admin_data as $key=>$value):
          Session::put($key,$value);
        endforeach;

        Session::save();

      }
      else{
        Session::put('system_message','Entered Credentials are not matching, please enter the correct ones !');
        Session::put('system_message_type','danger');
      }
      return $valid_user;
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
