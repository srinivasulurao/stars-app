<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

use App\WebserviceModel;
use App\Driver;
use App\Vehicle;

use Input;
use Session;
use Redirect;
// Status code https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
//http://tutsnare.com/remove-public-from-url-laravel/

class StarsAppWebservice extends Controller
{
    /**
     * Query all vehicles assigned to driver
     *
     * @param  int $driver_id unique id of driver
     */
    public function getDriverVehiclesById($driver_id)
    {
        $result = WebserviceModel::getDriverVehiclesByIdModel($driver_id);

        if ($result) {
    		echo WebserviceModel::jc(200,$result,"Data Generated Successfully");
    	}  else {
    		echo WebserviceModel::jc(204 ,$result,"Invalid Id, Hence no data found!");
    	}

    }

    /**
     * Query all students based on school
     *
     * @param  int $school_id unique id of school
     */
    public function getAllStudentsBySchool($school_id)
    {
        $result = WebserviceModel::getAllStudentsBySchoolModel($school_id);

        if ($result) {
    		echo WebserviceModel::jc(200,$result,"Data Generated Successfully");
    	}  else {
    		echo WebserviceModel::jc(204 ,$result,"Invalid Id, Hence no data found!");
    	}

    }

    /**
     * Query vehicle history based on vehicle id
     *
     * @param  int $school_id  unique id of school
     * @param  int $vehicle_id unique id of vehicle
     */
    public function getVehicleHistoryById($school_id, $vehicle_id)
    {
        $result = WebserviceModel::getVehicleHistoryByIdModel($school_id, $vehicle_id);

        if ($result) {
    		echo WebserviceModel::jc(200,$result,"Data Generated Successfully");
    	}  else {
    		echo WebserviceModel::jc(204 ,$result,"Invalid Id, Hence no data found!");
    	}
    }

    public function getTripHistoryByDriver($driver_id)
    {
        $result = WebserviceModel::getTripHistoryByDriverModel($driver_id);

        if ($result) {
    		echo WebserviceModel::jc(200,$result,"Data Generated Successfully");
    	}  else {
    		echo WebserviceModel::jc(204 ,$result,"Invalid Id, Hence no data found!");
    	}
    }

    /**
     * Adds new trip to database
     */
    
    /**
     * Update existing trip in database
     * @param  int $trip_id unique id of the trip to update
     */
    public function updateTrip($trip_id)
    {
        $result = WebserviceModel::updateTripModel($_POST, $trip_id);

        if ($result) {
            echo WebserviceModel::jc(200,$result,"Trip Updated Successfully!");
        } else {
            echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
        }
    }

    /**
     * Adds new pre-trip inspection to database
     */
    public function addPreTripInspection()
    {
        $result = WebserviceModel::addPreTripInspectionModel($_POST);

        if ($result) {
            echo WebserviceModel::jc(200,$result,"Pre-Trip Inspection Added Successfully!");
        } else {
            echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
        }
    }

    public function getEntityById($entity,$entity_id){
    	if($entity=="driver" || $entity=="drivers"){
           $result=WebserviceModel::getEntityByIdModel('drivers','driver_id',$entity_id);
           if($result):
	           $result->profile_pic=url($result->profile_pic);
	           $result->district=districtName($result->district_id);
	           $result->school=schoolName($result->school_id);
	           unset($result->password);
           endif;
    	}

    	if($entity=="incident" || $entity=="incidents"){
           $result=WebserviceModel::getEntityByIdModel('incidents','incident_id',$entity_id);
           if($result):
              $result->incident_attachment=url($result->incident_attachment);
           endif;
    	}

        if($entity=="school" || $entity=="schools"){
           $result=WebserviceModel::getEntityByIdModel('schools','school_id',$entity_id);
           if($result):
              $result->school_pic=url($result->school_pic);
           endif;
    	}
    	if($entity=="vehicle" || $entity=="vehicles"){
           $result=WebserviceModel::getEntityByIdModel('vehicles','vehicle_id',$entity_id);
           if($result):
	           $result->seat_arrangement_csv=url($result->seat_arrangement_csv);
	           $result->vehicle_image=url($result->vehicle_image);
	           $authorized_drivers=@explode(",",$result->authorized_drivers);
	           $drivers=array_map("driverName",$authorized_drivers);
	           $result->authorized_drivers=array_combine($authorized_drivers,$drivers);
	           $result->school=schoolName($result->school_id);
           endif;
    	}

    	if($entity=="district" || $entity=="districts"){
           $result=WebserviceModel::getEntityByIdModel('districts','district_id',$entity_id);
    	}

    	if($entity=="route_maps" || $entity=="route_map"){
           $result=WebserviceModel::getEntityByIdModel('routes_maps','route_id',$entity_id);
           if($result):
	           $result->district=districtName($result->district_id);
	           $result->school=schoolName($result->school_id);
	           $result->route_map_attachment=array_map("url",explode(",",$result->route_map_attachment));
           endif;
    	}

        if($entity=="trip_history" || $entity=="trip_historys"){
           $result=WebserviceModel::getEntityByIdModel('trip_history','trip_id',$entity_id);
           if($result):
	           $result->route_name=routeName($result->route_id);
	           $result->vehicle=vehicleName($result->vehicle_id);
	           $result->pre_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->pre_inspection_id);
	           $result->post_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->post_inspection_id);
	           $pre_inspection_data=unserialize(base64_decode($result->pre_inspection->inspection_data));
	           $post_inspection_data=unserialize(base64_decode($result->post_inspection->inspection_data));

	           $pre_inspection_step=array_map("inspectionStepName",array_keys($pre_inspection_data));
	           $post_inspection_step=array_map("inspectionStepName",array_keys($post_inspection_data));

	           $result->pre_inspection->inspection_data=array_filter(array_combine($pre_inspection_step,$pre_inspection_data));
	           $result->post_inspection->inspection_data=array_filter(array_combine($post_inspection_step,$post_inspection_data));
           endif;
    	}

    	if($entity=="maintenance_history" || $entity=="maintenance_historys"){
    		$result=WebserviceModel::getEntityByIdModel('vehicle_maintenance_history','issue_id',$entity_id);
    		if($result):
	    		$result->vehicle=vehicleName($result->vehicle_id);
	            $result->school=schoolName($result->school_id);
	            $result->driver=driverName($result->driver_id);
	            $result->problem=thresholdProblem($result->problem);
            endif;
    	}

    	if($entity=="trip_inspection_step" || $entity=="trip_inspection_steps"){
    		$result=WebserviceModel::getEntityByIdModel('trip_inspection_steps','inspection_step_id',$entity_id);
    		if($result):
    		    $result->step_image=url($result->step_image);
    	    endif;
    	}

    	if($entity=="discipline_referral" || $entity=="discipline_referrals"){
    		$result=WebserviceModel::getEntityByIdModel('discipline_referrals','complaint_id',$entity_id);
    		if($result):
	    		$result->vehicle=vehicleName($result->vehicle_id);
	            $result->school=schoolName($result->school_id);
	            $result->driver=driverName($result->driver_id);
            endif;
    	}

    	if($entity=="application_form" || $entity=="application_forms"){
    		$result=WebserviceModel::getEntityByIdModel('forms','form_id',$entity_id);
    		if($result):
	            $result->school=schoolName($result->school_id);
	            $result->form_attachment=url($result->form_attachment);
            endif;
    	}

    	if($entity=="threshold_problem" || $entity=="threshold_problems"){
    		$result=WebserviceModel::getEntityByIdModel('school_vehicle_threshold','threshold_id',$entity_id);
    		if($result):
	            $result->school=schoolName($result->school_id);
            endif;
    	}

    	if($entity=="student" || $entity=="students"){
    		$result=WebserviceModel::getEntityByIdModel('students','student_id',$entity_id);
    		if($result):
	            $result->school=schoolName($result->school_id);
	            $result->district=districtName($result->district_id);
            endif;
    	}



    	if($result){
    		echo WebserviceModel::jc(200,$result,"Data Generated Successfully");
    	}
    	else{
    		echo WebserviceModel::jc(204 ,$result,"Invalid Id, Hence no data found!");
    	}

    }

    public function getAllEntities($entity){

    	if($entity=="drivers"){
           $results=WebserviceModel::getAllEntityModel('drivers');

           if($results):
           	foreach($results as $result):
	           $result->profile_pic=url($result->profile_pic);
	           $result->district=districtName($result->district_id);
	           $result->school=schoolName($result->school_id);
	           unset($result->password);
	        endforeach;
           endif;
    	}

    	if($entity=="incidents"){
           $results=WebserviceModel::getAllEntityModel('incidents');
           if($results):
           foreach($results as $result):
              $result->incident_attachment=url($result->incident_attachment);
           endforeach;
           endif;
    	}

      if($entity=="route_types"){
           $results=WebserviceModel::getAllEntityModel('route_types');
      }


        if($entity=="schools"){
           $results=WebserviceModel::getAllEntityModel('schools');
           if($results):
           foreach($results as $result):
              $result->school_pic=url($result->school_pic);
           endforeach;
           endif;
    	}
    	if($entity=="vehicles"){
           $results=WebserviceModel::getAllEntityModel('vehicles');
           if($results):
           foreach($results as $result):
	           $result->seat_arrangement_csv=url($result->seat_arrangement_csv);
	           $result->vehicle_image=url($result->vehicle_image);
	           $authorized_drivers=@explode(",",$result->authorized_drivers);
	           $drivers=array_map("driverName",$authorized_drivers);
	           $result->authorized_drivers=array_combine($authorized_drivers,$drivers);
	           $result->school=schoolName($result->school_id);
           endforeach;
           endif;
    	}

    	if($entity=="districts"){
           $results=WebserviceModel::getAllEntityModel('districts');
    	}

      if($entity=="odometer"){
           $results=WebserviceModel::getAllEntityModel('odometer_range');
      }

    	if($entity=="route_maps"){
           $results=WebserviceModel::getAllEntityModel('routes_maps');
           if($results):
           foreach($results as $result):
	           $result->district=districtName($result->district_id);
	           $result->school=schoolName($result->school_id);
	           $result->route_map_attachment=array_map("url",explode(",",$result->route_map_attachment));
           endforeach;
           endif;
    	}

        if($entity=="trip_history"){
           $results=WebserviceModel::getAllEntityModel('trip_history');
           if($results):
           	foreach($results as $result):
	           $result->route_name=routeName($result->route_id);
	           $result->vehicle=vehicleName($result->vehicle_id);
	           $result->pre_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->pre_inspection_id);
	           $result->post_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->post_inspection_id);
	           $pre_inspection_data=unserialize(base64_decode($result->pre_inspection->inspection_data));
	           $post_inspection_data=unserialize(base64_decode($result->post_inspection->inspection_data));

	           $pre_inspection_step=array_map("inspectionStepName",array_keys($pre_inspection_data));
	           $post_inspection_step=array_map("inspectionStepName",array_keys($post_inspection_data));

	           $result->pre_inspection->inspection_data=array_filter(array_combine($pre_inspection_step,$pre_inspection_data));
	           $result->post_inspection->inspection_data=array_filter(array_combine($post_inspection_step,$post_inspection_data));
           endforeach;
           endif;
    	}

    	if($entity=="maintenance_history"){
    		$results=WebserviceModel::getAllEntityModel('vehicle_maintenance_history');
    		if($results):
    		foreach($results as $result):
	    		$result->vehicle=vehicleName($result->vehicle_id);
	            $result->school=schoolName($result->school_id);
	            $result->driver=driverName($result->driver_id);
	            $result->problem=thresholdProblem($result->problem);
            endforeach;
            endif;
    	}

    	if($entity=="trip_inspection_steps"){
    		$results=WebserviceModel::getAllEntityModel('trip_inspection_steps');
    		if($results):
    		foreach($results as $result):
    		    $result->step_image=url($result->step_image);
    	    endforeach;
    	    endif;
    	}

    	if($entity=="discipline_referrals"){
    		$results=WebserviceModel::getAllEntityModel('discipline_referrals');
    		if($results):
    		foreach($results as $result):
	    		$result->vehicle=vehicleName($result->vehicle_id);
	            $result->school=schoolName($result->school_id);
	            $result->driver=driverName($result->driver_id);
            endforeach;
            endif;
    	}

    	if($entity=="application_forms"){
    		$results=WebserviceModel::getAllEntityModel('forms');
    		if($results):
    		foreach($results as $result):
	            $result->school=schoolName($result->school_id);
	            $result->form_attachment=url($result->form_attachment);
            endforeach;
            endif;
    	}

    	if($entity=="threshold_problems"){
    		$results=WebserviceModel::getAllEntityModel('school_vehicle_threshold');
    		if($results):
    		foreach($results as $result):
	            $result->school=schoolName($result->school_id);
            endforeach;
            endif;
    	}

    	if($entity=="students"){
    		$results=WebserviceModel::getAllEntityModel('students');
    		if($results):
    		foreach($results as $result):
	            $result->school=schoolName($result->school_id);
	            $result->district=districtName($result->district_id);
            endforeach;
            endif;
    	}

    	if($results){
    		echo WebserviceModel::jc(200,$results,"Data Generated Successfully");
    	}
    	else{
    		echo WebserviceModel::jc(204 ,$results,"Bad Request, Hence no data found!");
    	}
    }

    public function loginDriver($email,$password){
      $result=WebserviceModel::loginDriver($email,$password);



    	if($result){
    		$result->profile_pic=url($result->profile_pic);
            $result->district=districtName($result->district_id);
            $result->school=schoolName($result->school_id);
            unset($result->password);

    		echo WebserviceModel::jc(200,$result,"Authentication Successfull");
    	}
    	else{
    		echo WebserviceModel::jc(204 ,$result,"Invalid Credentials, Please Enter Correct Credentials to access the system!");
    	}
    }

    public function createDriver(){

        $result=WebserviceModel::createDriverModel();
    	if($result){

    		echo WebserviceModel::jc(200,$result,"Driver Created Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}

    }

    public function updateDriver(){
    	$result=WebserviceModel::updateDriverModel();
    	if($result){

    		echo WebserviceModel::jc(200,$result,"Driver Updated Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }

    public function addPreInspection(){

    	$result=WebserviceModel::addPreInspectionModel($_POST);
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Pre-Trip Inspection Added Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }

    public function addTripHistory(){
        $result=WebserviceModel::addTripHistoryModel(Input::all());
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Trip History Added Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }

    public function updatePostInspection(){

    	$result=WebserviceModel::updatePostInspectionModel($_POST);
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Post-Trip Inspection Added Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }
    
    public function getFormBySchool($school_id){
        $result=WebserviceModel::getFormsBySchoolModel($school_id);
       
    	if($result){
    		echo WebserviceModel::jc(200,$result,"School forms genereated Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }
    
    public function getRouteMapsBySchool($school_id){
        $result=WebserviceModel::getEntityByIdModel('routes_maps','school_id',$school_id);
       
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Route Maps genereated Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,"Bad Request, Partial Content has been passed!");
    	}
    }
    
    public function addMaintenanceIssue(){
         $result=WebserviceModel::addMaintenanceIssueModel(Input::all());
         
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Maintenance Issue Added Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,WebserviceModel::$exception_error);
    	}
    }
    
    public function addDisciplineReferral(){
         $result=WebserviceModel::addDisciplineReferralModel(Input::all());
         
    	if($result){
    		echo WebserviceModel::jc(200,$result,"Added Discipline Referral Successfully!");
    	}
    	else{
    		echo WebserviceModel::jc(206 ,$result,WebserviceModel::$exception_error);
    	}
    }


    public function getEntityBySchool($entity,$school_id){
      $entity_id=$school_id;

      if($entity=="drivers"){
           $results=WebserviceModel::getAllEntityWithConditionModel('drivers','school_id',$school_id);

           if($results):
            foreach($results as $result):
             $result->profile_pic=url($result->profile_pic);
             $result->district=districtName($result->district_id);
             $result->school=schoolName($result->school_id);
             unset($result->password);
          endforeach;
           endif;
      }

      if($entity=="incidents"){
           $results=WebserviceModel::getAllEntityWithConditionModel('incidents','school_id',$school_id);
           if($results):
           foreach($results as $result):
              $result->incident_attachment=url($result->incident_attachment);
           endforeach;
           endif;
      }

      if($entity=="route_types"){
           $results=WebserviceModel::getAllEntityWithConditionModel('route_types','school_id',$school_id);
      }


        if($entity=="schools"){
           $results=WebserviceModel::getAllEntityWithConditionModel('schools','school_id',$school_id);
           if($results):
           foreach($results as $result):
              $result->school_pic=url($result->school_pic);
           endforeach;
           endif;
      }
      if($entity=="vehicles"){
           $results=WebserviceModel::getAllEntityWithConditionModel('vehicles','school_id',$school_id);
           if($results):
           foreach($results as $result):
             $result->seat_arrangement_csv=url($result->seat_arrangement_csv);
             $result->vehicle_image=url($result->vehicle_image);
             $authorized_drivers=@explode(",",$result->authorized_drivers);
             $drivers=array_map("driverName",$authorized_drivers);
             $result->authorized_drivers=array_combine($authorized_drivers,$drivers);
             $result->school=schoolName($result->school_id);
           endforeach;
           endif;
      }

      if($entity=="districts"){
           $results=WebserviceModel::getAllEntityWithConditionModel('districts','school_id',$school_id);
      }

      if($entity=="route_maps"){
           $results=WebserviceModel::getAllEntityWithConditionModel('routes_maps','school_id',$school_id);
           if($results):
           foreach($results as $result):
             $result->district=districtName($result->district_id);
             $result->school=schoolName($result->school_id);
             $result->route_map_attachment=array_map("url",explode(",",$result->route_map_attachment));
           endforeach;
           endif;
      }

        if($entity=="trip_history"){
           $results=WebserviceModel::getAllEntityWithConditionModel('trip_history','school_id',$school_id);
           if($results):
            foreach($results as $result):
             $result->route_name=routeName($result->route_id);
             $result->vehicle=vehicleName($result->vehicle_id);
             $result->pre_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->pre_inspection_id);
             $result->post_inspection=WebserviceModel::getEntityByIdModel('trip_inspections','inspection_id',$result->post_inspection_id);
             $pre_inspection_data=unserialize(base64_decode($result->pre_inspection->inspection_data));
             $post_inspection_data=unserialize(base64_decode($result->post_inspection->inspection_data));

             $pre_inspection_step=array_map("inspectionStepName",array_keys($pre_inspection_data));
             $post_inspection_step=array_map("inspectionStepName",array_keys($post_inspection_data));

             $result->pre_inspection->inspection_data=array_filter(array_combine($pre_inspection_step,$pre_inspection_data));
             $result->post_inspection->inspection_data=array_filter(array_combine($post_inspection_step,$post_inspection_data));
           endforeach;
           endif;
      }

      if($entity=="maintenance_history"){
        $results=WebserviceModel::getAllEntityWithConditionModel('vehicle_maintenance_history','school_id',$school_id);
        if($results):
        foreach($results as $result):
          $result->vehicle=vehicleName($result->vehicle_id);
              $result->school=schoolName($result->school_id);
              $result->driver=driverName($result->driver_id);
              $result->problem=thresholdProblem($result->problem);
            endforeach;
            endif;
      }

      if($entity=="trip_inspection_steps"){
        $results=WebserviceModel::getAllEntityWithConditionModel('trip_inspection_steps','school_id',$school_id);
        if($results):
        foreach($results as $result):
            $result->step_image=url($result->step_image);
          endforeach;
          endif;
      }

      if($entity=="discipline_referrals"){
        $results=WebserviceModel::getAllEntityWithConditionModel('discipline_referrals','school_id',$school_id);
        if($results):
        foreach($results as $result):
          $result->vehicle=vehicleName($result->vehicle_id);
              $result->school=schoolName($result->school_id);
              $result->driver=driverName($result->driver_id);
            endforeach;
            endif;
      }

      if($entity=="application_forms"){
        $results=WebserviceModel::getAllEntityWithConditionModel('forms','school_id',$school_id);
        if($results):
        foreach($results as $result):
              $result->school=schoolName($result->school_id);
              $result->form_attachment=url($result->form_attachment);
            endforeach;
            endif;
      }

      if($entity=="threshold_problems"){
        $results=WebserviceModel::getAllEntityWithConditionModel('school_vehicle_threshold','school_id',$school_id);
        if($results):
        foreach($results as $result):
              $result->school=schoolName($result->school_id);
            endforeach;
            endif;
      }

      if($entity=="students"){
        $results=WebserviceModel::getAllEntityWithConditionModel('students','school_id',$school_id);
        if($results):
        foreach($results as $result):
              $result->school=schoolName($result->school_id);
              $result->district=districtName($result->district_id);
            endforeach;
            endif;
      }

      if($results){
        echo WebserviceModel::jc(200,$results,"Data Generated Successfully");
      }
      else{
        echo WebserviceModel::jc(204 ,$results,"Bad Request, Hence no data found!");
      }

    }


}//end of Controller class.
