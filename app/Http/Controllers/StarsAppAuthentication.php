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
      return view('authentication.login',$data);
    }

    public function doLogin(Request $request){
      $email=$request->input('admin_email');
      $password=$request->input('admin_password');
      $valid_user=AuthenticationModel::AuthenticateAdmin($email,$password);
      if($valid_user)
      return Redirect::to('system-admin/dashboard');
      else
      return Redirect::to('login');
    }

    public function logout(){

        Session::flush();
        return Redirect::to("/");
    }
}
