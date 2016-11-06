<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use Session;
use Redirect;
use Input;



class WebserviceModel extends Model
{
    /**
     * Get all assigned vehicles for driver
     *
     * @param  int $driver_id unique id of driver
     * @return array            results of query
     */
    public static $exception_error="";
    public static function getDriverVehiclesByIdModel($driver_id)
    {
        //$result = DB::table('driver_vehicle')->join('drivers', 'driver_vehicle.driver_id', '=', 'drivers.driver_id')->join('vehicles', 'driver_vehicle.vehicle_id', '=', 'vehicles.vehicle_id')->where('drivers.driver_id', $driver_id)->get();  
        //$result=DB::table('vehicles')->whereRaw('FIND_IN_SET('.$driver_id.',authorized_drivers)');
        $result=DB::select("select * from vehicles WHERE FIND_IN_SET($driver_id,authorized_drivers)");
        return $result;
    }

    /**
     * Get all students by school id
     *
     * @param  int $school_id unique id of school
     * @return array            results of query
     */
    public static function getAllStudentsBySchoolModel($school_id)
    {
        $result = DB::table('students')->where('students.school_id', $school_id)->get();
        return $result;
    }

    /**
     * Get maintenance history for vehicle by school and vehicle id
     *
     * @param  int $school_id  unique id of school
     * @param  int $vehicle_id unique id of vehicle
     * @return array             results of query
     */
    public static function getVehicleHistoryByIdModel($school_id, $vehicle_id)
    {
        $result = DB::table('vehicle_maintenance_history')->where([['vehicle_maintenance_history.vehicle_id', '=', $vehicle_id], ['vehicle_maintenance_history.school_id', '=', $school_id]])->get();
        return $result;
    }

    public static function getTripHistoryByDriverModel($driver_id)
    {
        $result = DB::table('trip_history')->where('trip_history.driver_id', $driver_id)->get();
        return $result;
    }

    public static function getEntityByIdModel($table,$pi,$id){
     $result=DB::table($table)->where($pi,$id)->first();
     return $result;
    }

    public static function jc($type,$result,$message,$success="true"){
    	$json=array();
        $json['http_status']=$type;
    	$json['success']=$success;
    	$json['verbose_message']=$message;
    	$json['result']=$result;
    	return json_encode($json);
    }

    public static function loginDriver($email,$password){
        $encrypted_password=md5($password);
        $result=DB::table('drivers')->where('email',$email)->where('password',$encrypted_password)->first();
        $count=DB::table('drivers')->where('email',$email)->where('password',$encrypted_password)->count();
        if($count)
        return $result;
        else
        return "";
    }

    public static function createDriverModel(){
        $_this = new self;
        $details=array();

        if(Input::get('first_name'))
            $details['first_name']=Input::get('first_name');
        if(Input::get('last_name'))
            $details['last_name']=Input::get('last_name');
        if(Input::get('email'))
            $details['email']=Input::get('email');
        if(Input::get('password'))
            $details['password']=md5(Input::get('password'));
        if(Input::get('total_exp'))
            $details['total_exp']=Input::get('total_exp');
        if(Input::get('about_driver'))
            $details['about_driver']=Input::get('about_driver');
        if(Input::get('city'))
            $details['city']=Input::get('city');
        if(Input::get('state'))
            $details['state']=Input::get('state');
        if(Input::get('address'))
            $details['address']=Input::get('address');
        if(Input::get('district_id'))
            $details['district_id']=Input::get('district_id');
        if(Input::get('school_id'))
            $details['school_id']=Input::get('school_id');
        if(Input::get('phone'))
            $details['phone']=Input::get('phone');
        if(Input::get('profile_pic')):
            $profile_pic=$_this->HexaDecimalToImage(Input::get('profile_pic'));
            $details['profile_pic']=$profile_pic;
        endif;

        try {
            $last_insert_id=DB::table('drivers')->insertGetId($details);
            return $_this->getEntityByIdModel('drivers','driver_id',$last_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            return 0;
        } catch (\Exception $e) {
            return 0;
        }
    }

   public static function updateDriverModel(){
        $_this = new self;
        $details=array();

        if(Input::get('first_name'))
            $details['first_name']=Input::get('first_name');
        if(Input::get('last_name'))
            $details['last_name']=Input::get('last_name');
        if(Input::get('email'))
            $details['email']=Input::get('email');
        if(Input::get('password'))
            $details['password']=md5(Input::get('password'));
        if(Input::get('total_exp'))
            $details['total_exp']=Input::get('total_exp');
        if(Input::get('about_driver'))
            $details['about_driver']=Input::get('about_driver');
        if(Input::get('city'))
            $details['city']=Input::get('city');
        if(Input::get('state'))
            $details['state']=Input::get('state');
        if(Input::get('address'))
            $details['address']=Input::get('address');
        if(Input::get('district_id'))
            $details['district_id']=Input::get('district_id');
        if(Input::get('school_id'))
            $details['school_id']=Input::get('school_id');
        if(Input::get('phone'))
            $details['phone']=Input::get('phone');
        if(Input::get('profile_pic')):
            $profile_pic=$_this->HexaDecimalToImage(Input::get('profile_pic'));
            $details['profile_pic']=$profile_pic;
        endif;

        $driver_id=Input::get('driver_id');

        try {
            DB::table('drivers')->where('driver_id',$driver_id)->update($details);
            return $_this->getEntityByIdModel('drivers','driver_id',$driver_id);
        } catch (\Illuminate\Database\QueryException $e) {
            return 0;
        } catch (\Exception $e) {
            return 0;
        }
    }

    //--------------- Convert HexaDecimal To Image -----------------//

  public function HexaDecimalToImage($haxaString) {
    $destFolderName="../uploads/profile-pics";
    $destFileName = $destFolderName."/".uniqid() . '.png';
    $hex =  preg_replace('/[\s\W]+/','',$haxaString);
    $binary = @pack("H*", $hex);
    $success = file_put_contents($destFileName, $binary);

    if($success===false){
        @unlink($destFileName);
        return false;
    }else{
        $fullImageURL = str_replace('./uploads/', '/uploads/', $destFileName);
        return $fullImageURL;
    }

 }

 public static function getAllEntityModel($table){

    $results=DB::table($table)->get();
    return $results;

 }

 public static function getAllEntityWithConditionModel($table,$column,$value){
    $results=DB::table($table)->where($column,$value)->get();
    return $results;
 }

 /**
  * Add new trip to databse
  *
  * @param $data POST data
  */
 public static function addTripModel($data)
 {
     $details = Input::all();

     try {
         $last_insert_id = DB::table('trip_history')->insertGetId($details);
         return self::getEntityByIdModel('trip_history', 'trip_id', $last_insert_id);
     } catch (\Illuminate\Database\QueryException $e) {
         return 0;
     } catch (\Exception $e) {
         return 0;
     }
 }

 

 public static function updateTripModel($data, $trip_id)
 {
     $details = Input::all();

     try {
         DB::table('trip_history')->where('trip_id',$trip_id)->update($details);
         return self::getEntityByIdModel('trip_history', 'trip_id', $trip_id);
     } catch (\Illuminate\Database\QueryException $e) {
         return 0;
     } catch (\Exception $e) {
         return 0;
     }
 }

 /**
  * Add new pre-trip inspection to database
  * @param $data POST data
  */
 public static function addPreTripInspectionModel($data)
 {
     $details = Input::all();

     try {
         $last_insert_id = DB::table('pre_inspection')->insertGetId($details);
         return self::getEntityByIdModel('pre_inspection', 'id', $last_insert_id);
     } catch (\Illuminate\Database\QueryException $e) {
         echo $e;
         return 0;
     } catch (\Exception $e) {
         echo $e;
         return 0;
     }
 }

 public static function addTripHistoryModel(){
    $details=array();
    $details['route_id']=Input::get('route_id');
    $details['trip_time']=date("Y-m-d H:i:s",strtotime(Input::get('route_id')));
    $details['pre_trip']=Input::get('pre_trip');
    $details['post_trip']=Input::get('post_trip');
    $details['vehicle_id']=Input::get('vehicle_id');
    $details['trip_status']=Input::get('trip_status');
    $details['pre_inspection_id']=Input::get('pre_inspection_id');
    $details['post_inspection_id']=intval(Input::get('pre_inspection_id'))+1; // Increment By One.
    $details['total_riders']=Input::get('total_riders');

    try {
          $last_insert_id=DB::table('trip_history')->insertGetId($details);
            return self::getEntityByIdModel('trip_history','trip_id',$last_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            return 0;
        } catch (\Exception $e) {
            return 0;
        }

 }

 public static function addPreInspectionModel($post){
    $details=array();
    $details['comments']=$post['comments'];
    unset($post['comments']);
    $details['inspection_data']=base64_encode(serialize($post));
    try {
          $pre_insert_id=DB::table('trip_inspections')->insertGetId($details);
          //simulataneously create the post inspection entry as well.
          DB::table('trip_inspections')->insert(array("inspection_data"=>'',"comments"=>''));
            return self::getEntityByIdModel('trip_inspections','inspection_id',$pre_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            return 0;
        } catch (\Exception $e) {
            return 0;
        }
 }

 public static function updatePostInspectionModel($post){
    $details=array();
    $details['comments']=$post['comments'];
    $post_inspection_id=$post['post_inspection_id'];
    unset($post['comments']);
    unset($post['post_inspection_id']);
    $details['inspection_data']=base64_encode(serialize($post));

    try {
          DB::table('trip_inspections')->where('inspection_id',$post_inspection_id)->update($details);
            return self::getEntityByIdModel('trip_inspections','inspection_id',$post_inspection_id);
        } catch (\Illuminate\Database\QueryException $e) {
            return 0;
        } catch (\Exception $e) {
            return 0;
        }
 }

public static function getFormsBySchoolModel($school_id){
    $results=DB::table('forms')->where('school_id',$school_id)->get();
    return $results;
}
    
public static function addMaintenanceIssueModel($post){
    
    $details=array();
    $details['vehicle_id']=$post['vehicle_id'];
    $details['school_id']=$post['school_id'];
    $details['driver_id']=$post['driver_id'];
    $details['problem']=$post['problem'];
    $details['problem_occured_time']=date("Y-m-d H:i:s",strtotime($post['date_occurred']));
    $details['problem_location']=$post['problem_location'];
    $details['comments']=$post['comments'];
    
    try {
          $last_insert_id=DB::table('vehicle_maintenance_history')->insertGetId($details);
            return self::getEntityByIdModel('vehicle_maintenance_history','issue_id',$last_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            $this->exception_error=$e->getMessage();
            return 0;
        } catch (\Exception $e) {
            $this->exception_error=$e->getMessage();
            return 0;
        }
    
}
    
    public static function addDisciplineReferralModel($post){
        $details=array();
    $details['vehicle_id']=$post['vehicle_id'];
    $details['school_id']=$post['school_id'];
    $details['driver_id']=$post['driver_id'];
    $details['student_name']=$post['student_name'];
    $details['offence_time']=date("Y-m-d H:i:s",strtotime($post['date_occurred']));
    $details['offence']=$post['offense'];
    $details['offence_location']=$post['offense_location'];
    $details['comments']=$post['comments'];
    
    try {
          $last_insert_id=DB::table('discipline_referrals')->insertGetId($details);
            return self::getEntityByIdModel('discipline_referrals','complaint_id',$last_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            self::$exception_error=$e->getMessage();
            return 0;
        } catch (\Exception $e) {
            self::$exception_error=$e->getMessage();
            return 0;
        }
    }

    public static function addTripHistoryModel($post){
    $details=array();
    $details['route_id']=$post['route_id'];
    $details['school_id']=$post['school_id'];
    $details['driver_id']=$post['driver_id'];
    $details['student_name']=$post['student_name'];
    $details['offence_time']=date("Y-m-d H:i:s",strtotime($post['date_occurred']));
    $details['offence']=$post['offense'];
    $details['offence_location']=$post['offense_location'];
    $details['comments']=$post['comments'];
    
    try {
          $last_insert_id=DB::table('discipline_referrals')->insertGetId($details);
            return self::getEntityByIdModel('discipline_referrals','complaint_id',$last_insert_id);
        } catch (\Illuminate\Database\QueryException $e) {
            self::$exception_error=$e->getMessage();
            return 0;
        } catch (\Exception $e) {
            self::$exception_error=$e->getMessage();
            return 0;
        }
 }
    
    
}//WebserviceModel Ends Here.
