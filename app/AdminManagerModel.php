<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use Session;
use Redirect;
use Input;


class AdminManagerModel extends Model
{


public static function security(){
    //check session if user is logged in or not.
    if(empty(Session::get('admin_id'))){
        return 1;
    }
}
############################################
//Fetching all data
############################################    
   public static function getAllDrivers(){
     $results=DB::table("drivers")->get();
     return $results;
   }

    public static function getAllSchools(){
        $results=DB::table("schools")->get();
        return $results;
    }

    public static function getAllVehicles(){
        $results=DB::table("vehicles")->get();
        return $results;
    }

    public static function getAllDisciplineReferrals(){
        $results=DB::table("discipline_referrals")->get();
        return $results;
    }


    public static function getAllIncidents(){
        $results=DB::table("incidents")->get();
        return $results;
    }

    public static function getAllRoutes(){
        $results=DB::table("routes_maps")->get();
        return $results;
    }

    public static function getAllForms(){
        $results=DB::table("forms")->get();
        return $results;
    }

    public static function getAllTripInspectionSteps(){
        $results=DB::table('trip_inspection_steps')->orderBy('inspection_type')->get();
        return $results;
    }

    public static function getAllTripHistory(){
        $results=DB::table('trip_history')->get();
        return $results;
    }

    public static function getAllThresholdProblems(){
        $results=DB::table('school_vehicle_threshold')->get();
        return $results;
    }

    public static function getAllRouteTypes(){
        $results=DB::table('route_types')->get();
        return $results;
    }

############################################    
// Fetching total Attributes for Dashboard
############################################

    public static function getTotalEntities($table_name){
      return DB::table($table_name)->count();
    }
    public static function getTotalEntitiesWithCondition($table_name,$cond,$cond_value){
      return DB::table($table_name)->where($cond,$cond_value)->count();
    }
    
//Fetching data by Id
############################################

    public static function getDriverById($driver_id){
        $results=DB::table('drivers')->where('driver_id',$driver_id)->first();
        return $results;
    }
    public static function getIncidentById($incident_id){
        $results=DB::table('incidents')->where('incident_id',$incident_id)->first();
        return $results;
    }

    public static function getSchoolById($school_id){
        $results=DB::table('schools')->where('school_id',$school_id)->first();
        return $results;
    }

    public static function getRouteMapById($route_map_id){
        $results=DB::table('routes_maps')->where('route_id',$route_map_id)->first();
        return $results;
    }

    public static function getDisciplineReferralById($dr_id){
        $results=DB::table('discipline_referrals')->where('complaint_id',$dr_id)->first();
        return $results;
    }

    public static function getVehicleById($vehicle_id){
        $results=DB::table('vehicles')->where('vehicle_id',$vehicle_id)->first();
        return $results;
    }

    public static function getAllMaintenanceHistory(){
        $results=DB::table('vehicle_maintenance_history')->get();
        return $results;
    }

    public static function getMaintenanceHistoryById($issue_id){
        $results=DB::table('vehicle_maintenance_history')->where('issue_id',$issue_id)->first();
        return $results;
    }

    public static function getFormById($form_id){
        $results=DB::table('forms')->where('form_id',$form_id)->first();
        return $results;
    }

    public static function getInspectionStepById($inspection_step_id){
        $results=DB::table('trip_inspection_steps')->where('inspection_step_id',$inspection_step_id)->first();
        return $results;
    }

    public static function getTripHistoryById($th_id){
        $results=DB::table('trip_history')->where('trip_id',$th_id)->first();
        return $results;
    }

    public static function getTripInspectionById($inspection_id){
       $results=DB::table('trip_inspections')->where('inspection_id',$inspection_id)->first();
       return $results;
    }



    ######################################
    //Adding & Updating
    ######################################

    public static function addRouteMapDetails(){

        $details=array();
        $details['route_name']=Input::input('route_name');
        $details['school_id']=Input::input('school_id');
        $details['district_id']=Input::input('district_id');
        $details['route_start_latitude']=Input::input('route_start_latitude');
        $details['route_end_latitude']=Input::input('route_end_latitude');
        $details['route_start_longitude']=Input::input('route_start_longitude');
        $details['route_end_longitude']=Input::input('route_end_longitude');
        $details['route_type']=Input::input('route_type');
        $files=Input::file('route_map_attachment');

        if(sizeof($files)):
            $attachments=array();
            foreach($files as $file):
                $destinationPath = base_path('uploads/route-maps'); // upload path
                $extension = $file->getClientOriginalExtension(); // getting image extension
                $fileName = md5(rand()).time().'.'.$extension; // renaming.
                $file->move($destinationPath, $fileName); // uploading file to given path
                $attachments[]="/uploads/route-maps/".$fileName;
            endforeach;
            $details['route_map_attachment']=@implode(",",$attachments);
        endif;

        try {
            DB::table('routes_maps')->insert($details);
            Session::put('system_message','Route Map Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

    }

    public static function updateRouteMapDetails(){

        $details=array();
        $details['route_name']=Input::input('route_name');
        $details['school_id']=Input::input('school_id');
        $details['district_id']=Input::input('district_id');
        $details['route_start_latitude']=Input::input('route_start_latitude');
        $details['route_end_latitude']=Input::input('route_end_latitude');
        $details['route_start_longitude']=Input::input('route_start_longitude');
        $details['route_end_longitude']=Input::input('route_end_longitude');
        $details['route_type']=Input::input('route_type');
        $files=Input::file('route_map_attachment');
        if(sizeof($files)):
            $attachments=array();
        foreach($files as $file):
            $destinationPath = base_path('uploads/route-maps'); // upload path
            $extension = $file->getClientOriginalExtension(); // getting image extension
            $fileName = md5(rand()).time().'.'.$extension; // renaming.
            $file->move($destinationPath, $fileName); // uploading file to given path
            $attachments[]="/uploads/route-maps/".$fileName;
        endforeach;
           $details['route_map_attachment']=@implode(",",$attachments);
        endif;

        $route_map_id=Input::input('route_map_id');

        try {
            DB::table('routes_maps')->where('route_id',$route_map_id)->update($details);
            Session::put('system_message','Route Map Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function updateSchoolDetails(){
        $details=array();
        $details['school_name']=Input::input('school_name');
        $details['school_description']=Input::input('school_description');
        $details['school_address']=Input::input('school_address');
        $details['district_id']=Input::input('district_id');

        if (Input::hasFile('school_pic')):
            $destinationPath = base_path('uploads/school-pics'); // upload path
            $extension = Input::file('school_pic')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('school_pic')->move($destinationPath, $fileName); // uploading file to given path
            $details['school_pic']="/uploads/school-pics/".$fileName;
        endif;

        $school_id=Input::input('school_id');

        try {
            DB::table('schools')->where('school_id',$school_id)->update($details);
            Session::put('system_message','School Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function addSchoolDetails(){
        $details=array();
        $details['school_name']=Input::input('school_name');
        $details['school_description']=Input::input('school_description');
        $details['school_address']=Input::input('school_address');
        $details['district_id']=Input::input('district_id');

        if (Input::hasFile('school_pic')):
            $destinationPath = base_path('uploads/school-pics'); // upload path
            $extension = Input::file('school_pic')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('school_pic')->move($destinationPath, $fileName); // uploading file to given path
            $details['school_pic']="/uploads/school-pics/".$fileName;
        endif;



        try {
            DB::table('schools')->insert($details);
            Session::put('system_message','School Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function addDriverDetails($post){
        $details=array();
        $details['first_name']=$post->input('first_name');
        $details['last_name']=$post->input('last_name');
        $details['email']=$post->input('email');
        $details['total_exp']=$post->input('total_exp');
        $details['about_driver']=$post->input('about_driver');
        $details['city']=$post->input('city');
        $details['state']=$post->input('state');
        $details['address']=$post->input('address');
        $details['district_id']=$post->input('district_id');
        $details['school_id']=$post->input('school_id');
        $details['phone']=$post->input('phone');
        $details['password']="dadsadsa";
        if (Input::hasFile('profile_pic')):
            $destinationPath = base_path('uploads/profile-pics'); // upload path
            $extension = Input::file('profile_pic')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renameing image
            Input::file('profile_pic')->move($destinationPath, $fileName); // uploading file to given path
            $details['profile_pic']="/uploads/profile-pics/".$fileName;
        endif;

        $driver_id=$post->input('driver_id');

        try {
            DB::table('drivers')->where('driver_id',$driver_id)->insert($details);
            Session::put('system_message','Driver Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }


    public static function editDriverDetails($post){

        $details=array();
        $details['first_name']=$post->input('first_name');
        $details['last_name']=$post->input('last_name');
        $details['email']=$post->input('email');
        $details['total_exp']=$post->input('total_exp');
        $details['about_driver']=$post->input('about_driver');
        $details['city']=$post->input('city');
        $details['state']=$post->input('state');
        $details['address']=$post->input('address');
        $details['district_id']=$post->input('district_id');
        $details['school_id']=$post->input('school_id');
        $details['phone']=$post->input('phone');
        if (Input::hasFile('profile_pic')):
            $destinationPath = base_path('uploads/profile-pics'); // upload path
            $extension = Input::file('profile_pic')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renameing image
            Input::file('profile_pic')->move($destinationPath, $fileName); // uploading file to given path
            $details['profile_pic']="/uploads/profile-pics/".$fileName;
        endif;

        $driver_id=$post->input('driver_id');

        try {
            DB::table('drivers')->where('driver_id',$driver_id)->update($details);
            Session::put('system_message','Driver Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

    }
    

    public static function updateIncidentDetails(){

        $details=array();
        $details['about_incident']=Input::input('about_incident');
        $details['incident_type']=Input::input('incident_type');
        $details['incident_description']=Input::input('incident_description');
        $details['incident_location']=Input::input('incident_location');
        $details['name']=Input::input('name');
        $details['email']=Input::input('email');
        $details['phone']=Input::input('phone');

        if (Input::hasFile('incident_attachment')):
            $destinationPath = base_path('uploads/incidents'); // upload path
            $extension = Input::file('incident_attachment')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('incident_attachment')->move($destinationPath, $fileName); // uploading file to given path
            $details['incident_attachment']="/uploads/incidents/".$fileName;
        endif;

        $incident_id=Input::input('incident_id');

        try {
            DB::table('incidents')->where('incident_id',$incident_id)->update($details);
            Session::put('system_message','Incident Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function addIncidentDetails(){
        $details=array();
        $details['about_incident']=Input::input('about_incident');
        $details['incident_type']=Input::input('incident_type');
        $details['incident_description']=Input::input('incident_description');
        $details['incident_location']=Input::input('incident_location');
        $details['name']=Input::input('name');
        $details['email']=Input::input('email');
        $details['phone']=Input::input('phone');

        if (Input::hasFile('incident_attachment')):
            $destinationPath = base_path('uploads/incidents'); // upload path
            $extension = Input::file('incident_attachment')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('incident_attachment')->move($destinationPath, $fileName); // uploading file to given path
            $details['incident_attachment']="/uploads/incidents/".$fileName;
        endif;

        try {
            DB::table('incidents')->insert($details);
            Session::put('system_message','Incident Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function updateDisciplineReferralDetails(){
        $details=array();
        $details['school_id']=Input::input('school_id');
        $details['driver_id']=Input::input('driver_id');
        $details['student_name']=Input::input('student_name');
        $details['offence']=Input::input('offence');
        $details['offence_time']=date("Y-m-d,H:i:s",strtotime(Input::input('offence_time')));
        $details['offence_location']=Input::input('offence_location');
        $details['vehicle_id']=Input::input('vehicle_id');
        $details['comments']=Input::input('comments');

        $dr_id=Input::input('dr_id');

        try {
            DB::table('discipline_referrals')->where('complaint_id',$dr_id)->update($details);
            Session::put('system_message','Discipline Referral Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

   public static function addVehicleDetails(){
       $details=array();
       $details['vehicle_name']=Input::input('vehicle_name');
       $details['vehicle_no']=Input::input('vehicle_no');
       $details['authorized_drivers']=@implode(",",Input::input('authorized_drivers'));
       $details['occupancy']=Input::input('occupancy');
       $details['mileage']=Input::input('mileage');
       $details['created_date']=date("Y-m-d H:i:s",strtotime(Input::input('created_date')));
       $details['school_id']=Input::input('school_id');


       if (Input::hasFile('vehicle_image')):
           $destinationPath = base_path('uploads/vehicle-pics'); // upload path
           $extension = Input::file('vehicle_image')->getClientOriginalExtension(); // getting image extension
           $fileName = md5(time()).'.'.$extension; // renaming.
           Input::file('vehicle_image')->move($destinationPath, $fileName); // uploading file to given path
           $details['vehicle_image']="/uploads/vehicle-pics/".$fileName;
       endif;

       if (Input::hasFile('seat_arrangement_csv')):
           $destinationPath = base_path('uploads/seat-arrangement-csv'); // upload path
           $extension = Input::file('seat_arrangement_csv')->getClientOriginalExtension(); // getting image extension
           $fileName = md5(time()).'.'.$extension; // renaming.
           Input::file('seat_arrangement_csv')->move($destinationPath, $fileName); // uploading file to given path
           $details['seat_arrangement_csv']="/uploads/seat-arrangement-csv/".$fileName;
       endif;

       try {
           DB::table('vehicles')->insert($details);
           Session::put('system_message','Vehicle Details Added Successfully !');
           Session::put('system_message_type','success');
       } catch (\Illuminate\Database\QueryException $e) {
           Session::put('system_message',$e->getMessage());
           Session::put('system_message_type','danger');
       } catch (\Exception $e) {
           Session::put('system_message',$e->getMessage());
           Session::put('system_message_type','danger');
       }
   }

    public static function updateVehicleDetails(){
        $details=array();
        $details['vehicle_name']=Input::input('vehicle_name');
        $details['vehicle_no']=Input::input('vehicle_no');
        $details['authorized_drivers']=@implode(",",Input::input('authorized_drivers'));
        $details['occupancy']=Input::input('occupancy');
        $details['mileage']=Input::input('mileage');
        $details['created_date']=date("Y-m-d H:i:s",strtotime(Input::input('created_date')));
        $details['school_id']=Input::input('school_id');


        if (Input::hasFile('vehicle_image')):
            $destinationPath = base_path('uploads/vehicle-pics'); // upload path
            $extension = Input::file('vehicle_image')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('vehicle_image')->move($destinationPath, $fileName); // uploading file to given path
            $details['vehicle_image']="/uploads/vehicle-pics/".$fileName;
        endif;

        if (Input::hasFile('seat_arrangement_csv')):
            $destinationPath = base_path('uploads/seat-arrangement-csv'); // upload path
            $extension = Input::file('seat_arrangement_csv')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('seat_arrangement_csv')->move($destinationPath, $fileName); // uploading file to given path
            $details['seat_arrangement_csv']="/uploads/seat-arrangement-csv/".$fileName;
        endif;

        $vehicle_id=Input::input('vehicle_id');

        try {
            DB::table('vehicles')->where('vehicle_id',$vehicle_id)->update($details);
            Session::put('system_message','Vehicle Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }
    public static function addDisciplineReferralDetails(){
        $details=array();
        $details['school_id']=Input::input('school_id');
        $details['driver_id']=Input::input('driver_id');
        $details['student_name']=Input::input('student_name');
        $details['offence']=Input::input('offence');
        $details['offence_time']=date("Y-m-d,H:i:s",strtotime(Input::input('offence_time')));
        $details['offence_location']=Input::input('offence_location');
        $details['vehicle_id']=Input::input('vehicle_id');
        $details['comments']=Input::input('comments');

        try {
            DB::table('discipline_referrals')->insert($details);
            Session::put('system_message','Discipline Referral Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function updateMaintenanceHistoryDetails(){
      $details=array();
        $details['school_id']=Input::input('school_id');
        $details['driver_id']=Input::input('driver_id');
        $details['vehicle_id']=Input::input('vehicle_id');
        $details['problem_occured_time']=date("Y-m-d,H:i:s",strtotime(Input::input('problem_occured_time')));
        $details['problem_location']=Input::input('problem_location');
        $details['problem']=Input::input('problem');
        $details['comments']=Input::input('comments');

        $issue_id=Input::input('issue_id');
        try {
            DB::table('vehicle_maintenance_history')->where('issue_id',$issue_id)->update($details);
            Session::put('system_message','Maintenance History Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

    }

    public static function addMaintenanceHistoryDetails(){

        $details=array();
        $details['school_id']=Input::input('school_id');
        $details['driver_id']=Input::input('driver_id');
        $details['vehicle_id']=Input::input('vehicle_id');
        $details['problem_occured_time']=date("Y-m-d,H:i:s",strtotime(Input::input('problem_occured_time')));
        $details['problem_location']=Input::input('problem_location');
        $details['problem']=Input::input('problem');
        $details['comments']=Input::input('comments');

        try {
            DB::table('vehicle_maintenance_history')->insert($details);
            Session::put('system_message','Maintenance History Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

    }

    public static function updateFormDetails(){
        $details=array();
        $details['form_name']=Input::input('form_name');
        $details['form_description']=Input::input('form_description');
        $details['school_id']=Input::input('school_id');

        if (Input::hasFile('form_attachment')):
            $destinationPath = base_path('uploads/forms'); // upload path
            $extension = Input::file('form_attachment')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('form_attachment')->move($destinationPath, $fileName); // uploading file to given path
            $details['form_attachment']="/uploads/forms/".$fileName;
        endif;

        $form_id=Input::input('form_id');

        try {
            DB::table('forms')->where('form_id',$form_id)->update($details);
            Session::put('system_message','Form Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

   public static function addFormDetails(){
       $details=array();
        $details['form_name']=Input::input('form_name');
        $details['form_description']=Input::input('form_description');
        $details['school_id']=Input::input('school_id');

        if (Input::hasFile('form_attachment')):
            $destinationPath = base_path('uploads/forms'); // upload path
            $extension = Input::file('form_attachment')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('form_attachment')->move($destinationPath, $fileName); // uploading file to given path
            $details['form_attachment']="/uploads/forms/".$fileName;
        endif;

        try {
            DB::table('forms')->insert($details);
            Session::put('system_message','Form Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function updateInspectionStepDetails(){
       $details=array();
        $details['step']=Input::input('step');
        $details['inspection_type']=Input::input('inspection_type');

        if (Input::hasFile('step_image')):
            $destinationPath = base_path('uploads/inspection-steps'); // upload path
            $extension = Input::file('step_image')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('step_image')->move($destinationPath, $fileName); // uploading file to given path
            $details['step_image']="/uploads/inspection-steps/".$fileName;
        endif;
        $inspection_step_id=Input::get('inspection_step_id');
        try {
            DB::table('trip_inspection_steps')->where('inspection_step_id',$inspection_step_id)->update($details);
            Session::put('system_message','Inspection Step Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function addInspectionStepDetails(){
        $details=array();
        $details['step']=Input::input('step');
        $details['inspection_type']=Input::input('inspection_type');

        if (Input::hasFile('step_image')):
            $destinationPath = base_path('uploads/inspection-steps'); // upload path
            $extension = Input::file('step_image')->getClientOriginalExtension(); // getting image extension
            $fileName = md5(time()).'.'.$extension; // renaming.
            Input::file('step_image')->move($destinationPath, $fileName); // uploading file to given path
            $details['step_image']="/uploads/inspection-steps/".$fileName;
        endif;

        try {
            DB::table('trip_inspection_steps')->insert($details);
            Session::put('system_message','Inspection Step Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function updateTripHistoryDetails(){
        $details=array();
        $details['route_id']=Input::input('route_id');
        $details['pre_trip']=Input::input('pre_trip');
        $details['post_trip']=Input::input('post_trip');
        $details['trip_time']=date("Y-m-d,H:i:s",strtotime(Input::input('trip_time')));
        $details['trip_status']=Input::input('trip_status');

        $trip_id=Input::get('trip_id');
        try {
            DB::table('trip_history')->where('trip_id',$trip_id)->update($details);
            Session::put('system_message','Trip Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function addTripHistoryDetails(){
       $details=array();
        $details['route_id']=Input::input('route_id');
        $details['pre_trip']=Input::input('pre_trip');
        $details['post_trip']=Input::input('post_trip');
        $details['trip_time']=date("Y-m-d,H:i:s",strtotime(Input::input('trip_time')));
        $details['trip_status']=Input::input('trip_status');
        $details['pre_inspection_id']=Input::input('pre_inspection_id');
        $details['post_inspection_id']=intval($details['pre_inspection_id'])+1; // The exact next would be the trip history data.

        try {
            DB::table('trip_history')->insert($details);
            Session::put('system_message','Trip Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

//Trip Inspection

   public static function addPreTripDetails($post){
    
    $details=array();
    $details['comments']=$post['comments'];
    $details['odometer_reading']=$post['odometer_reading'];
    unset($post['_token']);
    unset($post['comments']);
    unset($post['odometer_reading']);
    $details['inspection_data']=base64_encode(serialize($post));

    try {
            DB::table('trip_inspections')->insert($details);
            Session::put('system_message','Pre Inspection Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

        $trip_inspection_table=DB::select('select * from trip_inspections order by inspection_id DESC');
        return $trip_inspection_table[0]->inspection_id;
   }

   public static function addPostTripDetails($last_insert_id){
      $details=array();
      $details['inspection_id']=$last_insert_id+1;
      $details['inspection_data']=base64_encode(serialize(array()));   // Serialize an empty array
     try {
            DB::table('trip_inspections')->insert($details);
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function updatePostTripDetails($post){
    $details=array();
    $post_survey_id=Input::input('post_survey_id');
    $details['comments']=$post['comments'];
    $details['odometer_reading']=$post['odometer_reading'];
    unset($post['_token']);
    unset($post['comments']);
    unset($post['odometer_reading']);
    $details['inspection_data']=base64_encode(serialize($post));
    
    try {
            DB::table('trip_inspections')->where('inspection_id',$post_survey_id)->update($details);
            Session::put('system_message','Post Inspection Details Saved Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

   }

//Threshold Problems
   public static function addThresholdProblemModel($post){

      $details=array();
      $details['threshold']=$post['threshold'];
      $details['threshold_value']=$post['threshold_value'];
      $details['school_id']=$post['school_id'];
      
     try {
            DB::table('school_vehicle_threshold')->insert($details);
            Session::put('system_message','Threshold Problem Details Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function updateThresholdProblemModel($post){
       $details=array();
      $details['threshold']=$post['threshold'];
      $details['threshold_value']=$post['threshold_value'];
      $details['school_id']=$post['school_id'];
      
     try {
            DB::table('school_vehicle_threshold')->where('threshold_id',$post['threshold_id'])->update($details);
            Session::put('system_message','Threshold Problem Details Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }


//Route Types
   public static function addRouteTypeModel($post){

      $details=array();
      $details['type']=$post['type'];
      
      
     try {
            DB::table('route_types')->insert($details);
            Session::put('system_message','Route Type Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }

   public static function updateRouteTypeModel($post){
     $details=array();
      $details['type']=$post['type'];
     
     try {
            DB::table('route_types')->where('id',$post['id'])->update($details);
            Session::put('system_message','Route Type Updated Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
   }
   //Finall the deletion is happening here

   public static function deleteSingleEntity($page,$table,$primary_index,$id){


        try {
            DB::table($table)->where($primary_index,$id)->delete();
            Session::put('system_message','Data Deleted Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

   }


   

}//Class ends here.
