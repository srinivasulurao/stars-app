<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use Session;

class AuthenticationModel extends Model
{
    //

    public static function AuthenticateAdmin($email, $password){
      //Check the user present or not from database.
      $md5=md5($password);
      $valid_user=DB::table('admin')->where('email',$email)->where("password",$md5)->count();
      if($valid_user){
        $admin_data=DB::table('admin')->where('email',$email)->where("password",$md5)->first();
        foreach($admin_data as $key=>$value):
          Session::put($key,$value);
        endforeach;
      }
      else{
        Session::put('system_message','Entered Credentials are not matching, please enter the correct ones !');
        Session::put('system_message_type','danger');
      }
      return $valid_user;
    }

}
