<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;

use App\AuthenticationModel;

use Input;
use Session;
use Redirect;

class StarsAppAuthentication extends Controller
{
    
    public function index(){
      $data=array();
      $data['title']="StarsApp-Login";
      $data['cookie_admin_email']=isset($_COOKIE['admin_email'])?$_COOKIE['admin_email']:"";
      $data['cookie_admin_password']=isset($_COOKIE['admin_password'])?$_COOKIE['admin_password']:"";
      $data['cookie_remember_me']=isset($_COOKIE['remember_me'])?"checked='checked'":"";
      return view('authentication.login',$data);
    }

    public function doLogin(Request $request){
      $email=$request->input('admin_email');
      $password=$request->input('admin_password');
      $valid_user=AuthenticationModel::AuthenticateAdmin($email,$password);
      
      if($valid_user){
      
        //Setting cookie for 1 week.
        if($request->input('remember_me')){
          setcookie("admin_email",$request->input('admin_email'),time()+(24*3600*7));
          setcookie("admin_password",$request->input('admin_password'),time()+(24*3600*7));
          setcookie("remember_me",$request->input('remember_me'),time()+(24*3600*7));
        }
        else{ 
           //set Cookie with negative time value.
          setcookie("admin_email",$request->input('admin_email'),time()-(24*3600*7));
          setcookie("admin_password",$request->input('admin_password'),time()-(24*3600*7));
          setcookie("remember_me",$request->input('remember_me'),time()-(24*3600*7));
        }
        $session=Session::all();
        $admin_data=(array)$session[0];
          if($admin_data['redirection']=="dashboard")
              return Redirect::to('system-admin/dashboard');
          else
              return Redirect::to('billing-admin/invoices');
      }
      else
      return Redirect::to('login');
    }

    public function doRegistration(){
      AuthenticationModel::createAdminUser();
      return Redirect::to('registration');
    }

    public function forgotCredentials(){
        $data=array();
        $data['title']="StarsApp-Forgot Credentials";  
        return view('authentication.forgot-credentials',$data);
    }

    public function checkForgotCredentials(){
       AuthenticationModel::AuthenticateSystemAdmin();
       return Redirect::to('forgot-credentials');
    }

    public function resetAdminPassword($authentication_string){
        $data=array();
        $data['title']="StarsApp-Reset Password";  
        $authentication_valid=AuthenticationModel::checkAuthenticationString($authentication_string);
        $data['authentication_string']=$authentication_string;
        $data['authentication_valid']=$authentication_valid;
        return view('authentication.reset-admin-password',$data);
    }

    public function resetAdminPasswordDetails(){  
        AuthenticationModel::resetAdminPasswordDetails();
    }

    public function registration(){
      $data=array();
      $data['title']="StarsApp-Admin Registration";
      $data['cookie_reg_display_name']=isset($_COOKIE['reg_display_name'])?$_COOKIE['reg_display_name']:"";
      $data['cookie_reg_email']=isset($_COOKIE['reg_email'])?$_COOKIE['reg_email']:"";
      $data['cookie_reg_redirection']=isset($_COOKIE['reg_redirection'])?$_COOKIE['reg_redirection']:"";
      return view('authentication.registration',$data);
    }

    public function activateAdminAccount($encoded_email){
     AuthenticationModel::activateAdminAccount($encoded_email);
     return Redirect::to('login');
    }

    public function logout(){

        Session::flush();
        return Redirect::to("/");
    }


}
