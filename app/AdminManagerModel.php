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

    public static function addRouteMapDetails(){

        $details=array();
        $details['route_name']=Input::input('route_name');
        $details['school_id']=Input::input('school_id');
        $details['district_id']=Input::input('district_id');
        $details['route_start_latitude']=Input::input('route_start_latitude');
        $details['route_end_latitude']=Input::input('route_end_latitude');
        $details['route_start_longitude']=Input::input('route_start_longitude');
        $details['route_end_longitude']=Input::input('route_end_longitude');
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
        $details['district']=$post->input('district');
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
        $details['district']=$post->input('district');
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


    public static function updateVehicleDetails(){
        $details=array();
        $details['vehicle_name']=Input::input('vehicle_name');
        $details['vehicle_no']=Input::input('vehicle_no');
        $details['authorized_drivers']=@implode(",",Input::input('authorized_drivers'));
        $details['occupancy']=Input::input('occupancy');
        $details['created_date']=date("Y-m-d H:i:s",strtotime(Input::input('created_date')));


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



}//Class ends here.
