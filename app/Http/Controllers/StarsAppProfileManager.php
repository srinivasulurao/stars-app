<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;

use App\AuthenticationModel;
use App\AdminManagerModel;

use Input;
use Session;
use Redirect;

class StarsAppProfileManager extends Controller
{
function __construct(Request $request){

    $session_deactivated=AdminManagerModel::security();
    if($session_deactivated){
        //redirector('/');
    }
}
###############################################    
//Dashboard Stuff
###############################################

    public function dashboard(){
      $data=array();
      $data['title']="StarsApp-Dashboard";
      $data['total_schools']=AdminManagerModel::getTotalEntities('schools');
      $data['total_drivers']=AdminManagerModel::getTotalEntities('drivers');
      $data['total_vehicles']=AdminManagerModel::getTotalEntities('vehicles');

      $data['total_incidents']=AdminManagerModel::getTotalEntities('schools');
      $data['total_dr']=AdminManagerModel::getTotalEntities('discipline_referrals');
      $data['total_mi']=AdminManagerModel::getTotalEntities('vehicle_maintenance_history');

      $data['total_routes']=AdminManagerModel::getTotalEntities('routes_maps');
      $data['total_forms']=AdminManagerModel::getTotalEntities('forms');



      $data['total_trips']=AdminManagerModel::getTotalEntities('trip_history');
      $data['total_trips_complete']=AdminManagerModel::getTotalEntitiesWithCondition('trip_history',"trip_status","complete");
      $data['total_trips_incomplete']=AdminManagerModel::getTotalEntitiesWithCondition('trip_history',"trip_status","incomplete");


      return view('profile.dashboard',$data);
    }

##################################################
//Driver Stuff
##################################################    
    public function drivers(){
      $data=array();
      $data['title']="StarsApp-Drivers";
      $data['results']=AdminManagerModel::getAllDrivers();
      return view('profile.drivers',$data);
    }
    public function editDriver($driver_id){
        $data['title']="StarsApp-Update Driver Details";
        $data['result']=AdminManagerModel::getDriverById($driver_id);
        $data['driver_id']=$driver_id;
        return view('profile.edit.edit-driver',$data);
    }

    public function editDriverDetails(Request $request){
       AdminManagerModel::editDriverDetails($request);
        $driver_id=$request->input('driver_id');
        return Redirect::to('/system-admin/driver/edit/'.$driver_id);
    }

    public function addDriver(){
        $data['title']="StarsApp-Add New Driver";
        return view('profile.add.add-driver',$data);
    }

     public function addDriverDetails(Request $request){
        AdminManagerModel::addDriverDetails($request);
        return Redirect::to('/system-admin/drivers');
    }

##################################################
//School Stuff    
##################################################

    public function schools(){
        $data['title']="StarsApp-Schools";
        $data['results']=AdminManagerModel::getAllSchools();
        return view('profile.schools',$data);
    }

        public function updateSchool($school_id){
        $data['title']="StarsApp-Update School Details";
        $data['result']=AdminManagerModel::getSchoolById($school_id);
        $data['school_id']=$school_id;
        return view('profile.edit.edit-school',$data);
    }

    public function updateSchoolDetails(){
        AdminManagerModel::updateSchoolDetails();
        $school_id=Input::get('school_id');
        return Redirect::to('/system-admin/school/edit/'.$school_id);
    }

    public function addSchool(){
        $data['title']="StarsApp-Add New School";
        return view('profile.add.add-school',$data);
    }

    public function addSchoolDetails(){
        AdminManagerModel::addSchoolDetails();
        return Redirect::to('/system-admin/schools');
    }

##################################################
//Vehicle Stuff
##################################################

   public function vehicles(){
        $data['title']="StarsApp-Vehicles";
        $data['results']=AdminManagerModel::getAllVehicles();
        return view('profile.vehicles',$data);
    }

    public function updateVehicle($vehicle_id){
        $data['title']="StarsApp-Update Discipline Referral";
        $data['result']=AdminManagerModel::getVehicleById($vehicle_id);
        $data['vehicle_id']=$vehicle_id;
        return view('profile.edit.edit-vehicle',$data);

    }

    public function addVehicle(){
        $data['title']="StarsApp-Add New Vehicle";
        return view('profile.add.add-vehicle',$data);
    }

    public function updateVehicleDetails(){
        AdminManagerModel::updateVehicleDetails();
        $vehicle_id=Input::get('vehicle_id');
        return Redirect::to('/system-admin/vehicle/edit/'.$vehicle_id);
    }

    public function addVehicleDetails(){
        AdminManagerModel::addVehicleDetails();
        return Redirect::to('/system-admin/vehicles');
    }

##################################################
//Discipline Referral
##################################################    

    public function disciplineReferrals(){
        $data['title']="StarsApp-Discipline Referrals";
        $data['results']=AdminManagerModel::getAllDisciplineReferrals();
        return view('profile.discipline-referrals',$data);
    }

      public function updateDisciplineReferral($dr_id){
        $data['title']="StarsApp-Update Discipline Referral";
        $data['result']=AdminManagerModel::getDisciplineReferralById($dr_id);
        $data['dr_id']=$dr_id;
        return view('profile.edit.edit-discipline-referral',$data);
    }

    public function updateDisciplineReferralDetails(){
        AdminManagerModel::updateDisciplineReferralDetails();
        $dr_id=Input::get('dr_id');
        return Redirect::to('/system-admin/discipline-referral/edit/'.$dr_id);
    }

    public function addDisciplineReferral(){
        $data['title']="StarsApp-Add New Discipline Referral";
        return view('profile.add.add-discipline-referral',$data);
    }

    public function addDisciplineReferralDetails(){
        AdminManagerModel::addDisciplineReferralDetails();
        return Redirect::to('/system-admin/discipline-referrals');
    }

##################################################
//Incidents
##################################################

    public function incidents(){
        $data['title']="StarsApp-Incidents";
        $data['results']=AdminManagerModel::getAllIncidents();
        return view('profile.incidents',$data);
    }

    public function updateIncident($incident_id){
        $data['title']="StarsApp-Update Incident Details";
        $data['result']=AdminManagerModel::getIncidentById($incident_id);
        $data['incident_id']=$incident_id;
        return view('profile.edit.edit-incident',$data);
    }

    public function updateIncidentDetails(){
        AdminManagerModel::updateIncidentDetails();
        $incident_id=Input::get('incident_id');
        return Redirect::to('/system-admin/incident/edit/'.$incident_id);
    }

    public function addIncident(){
        $data['title']="StarsApp-Add New Incident";
        return view('profile.add.add-incident',$data);
    }

    public function addIncidentDetails(){
        AdminManagerModel::addIncidentDetails();
        return Redirect::to('/system-admin/incidents');
    }

##################################################
//Route Maps
##################################################

    public function routeMaps(){
        $data['title']="StarsApp-Route Maps";
        $data['results']=AdminManagerModel::getAllRoutes();
        return view('profile.route-maps',$data);
    }
    public function updateRouteMap($route_map_id){
        $data['title']="StarsApp-Update Route-Map Details";
        $data['result']=AdminManagerModel::getRouteMapById($route_map_id);
        $data['route_map_id']=$route_map_id;
        return view('profile.edit.edit-routemap',$data);
    }

    public function updateRouteMapDetails(){
        AdminManagerModel::updateRouteMapDetails();
        $route_map_id=Input::get('route_map_id');
        return Redirect::to('/system-admin/route-map/edit/'.$route_map_id);
    }

    public function addRouteMap(){
        $data['title']="StarsApp-Add New Route Map";
        return view('profile.add.add-routemap',$data);
    }
    public function addRouteMapDetails(){
        AdminManagerModel::addRouteMapDetails();
        return Redirect::to('/system-admin/route-maps');
    }

##################################################  
//Seating Charts    
##################################################    

    public function seatingCharts(){
        $data['title']="StarsApp-Seating Arrangements";
        $data['results']=AdminManagerModel::getAllVehicles();
        return view('profile.seating-charts',$data);
    }

    public function viewSeatingChart($sc_id){
        $data['title']="StarsApp-View Seating Arrangement";
        $data['result']=AdminManagerModel::getVehicleById($sc_id);
        return view('profile.view.seating-arrangement',$data);
    }

##################################################
//Maintenance History
##################################################    

    public function maintenanceHistory(){
        $data['title']="StarsApp-Maintenance History";
        $data['results']=AdminManagerModel::getAllMaintenanceHistory();
        return view('profile.maintenance-history',$data);
    }

    public function updateMaintenanceHistory($issue_id){
        $data['title']="StarsApp-Update Maintenance History Details";
        $data['result']=AdminManagerModel::getMaintenanceHistoryById($issue_id);
        $data['issue_id']=$issue_id;
        return view('profile.edit.edit-maintenance-history',$data);
    }

    public function updateMaintenanceHistoryDetails(){
        AdminManagerModel::updateMaintenanceHistoryDetails();
        $mh_id=Input::get('issue_id');
        return Redirect::to('/system-admin/maintenance-history/edit/'.$mh_id);
    }

    public function addMaintenanceHistory(){
       $data['title']="StarsApp-Add New Maintenance History Details";
       return view('profile.add.add-maintenance-history',$data);
    }

    public function addMaintenanceHistoryDetails(){
        AdminManagerModel::addMaintenanceHistoryDetails();
        return Redirect::to('/system-admin/maintenance-history');
    }

################################################## 
//Forms
##################################################
 public function forms(){
        $data['title']="StarsApp-Forms List";
        $data['results']=AdminManagerModel::getAllForms();
        return view('profile.forms',$data);
}

public function updateForm($form_id){
        $data['title']="StarsApp-Update Form Details";
        $data['result']=AdminManagerModel::getFormById($form_id);
        $data['form_id']=$form_id;
        return view('profile.edit.edit-form',$data);
}

public function addForm(){
    $data['title']="StarsApp-Add New Form Details";
    return view('profile.add.add-form',$data);
}

public function updateFormDetails(){
        AdminManagerModel::updateFormDetails();
        $form_id=Input::get('form_id');
        return Redirect::to('/system-admin/form/edit/'.$form_id);
}

public function addFormDetails(){
       AdminManagerModel::addFormDetails();
        return Redirect::to('/system-admin/forms');
}

#################################################
//Trip Inspection Steps #########################
#################################################

public function inspectionSteps(){
    $data['title']="StarsApp-Forms List";
    $data['results']=AdminManagerModel::getAllTripInspectionSteps();
    return view('profile.trip-inspection-steps',$data);
}

public function updateInspectionStep($inspection_step_id){
    $data['title']="StarsApp-Update Trip Inspection Step";
    $data['result']=AdminManagerModel::getInspectionStepById($inspection_step_id);
    $data['inspection_step_id']=$inspection_step_id;
    return view('profile.edit.edit-inspection-step',$data);
}

public function addInspectionStep(){
    $data['title']="StarsApp-Add Trip Inspection Step";
    return view('profile.add.add-inspection-step',$data);
}

public function updateInspectionStepDetails(){
    AdminManagerModel::updateInspectionStepDetails();
    $inspection_step_id=Input::get('inspection_step_id');
    return Redirect::to('/system-admin/inspection-step/edit/'.$inspection_step_id);
}

public function addInspectionStepDetails(){
    AdminManagerModel::addInspectionStepDetails();
    return Redirect::to('/system-admin/inspection-steps');
}

################################################## 
//Trip History
##################################################

public function tripHistory(){
   $data['title']="StarsApp-Trip History";
    $data['results']=AdminManagerModel::getAllTripHistory();
    return view('profile.trip-history',$data); 
}

public function updateTripHistory($th_id){
    $data['title']="StarsApp-Update Trip History";
    $data['result']=AdminManagerModel::getTripHistoryById($th_id);
    $data['trip_id']=$th_id;
    return view('profile.edit.edit-trip-history',$data);
}

public function addTripHistory($inspection_id){
    $data['title']="StarsApp-Add Trip History";
    $data['pre_inspection_id']=$inspection_id;
    return view('profile.add.add-trip-history',$data);
}

public function updateTripHistoryDetails(){
    AdminManagerModel::updateTripHistoryDetails();
    $trip_id=Input::get('trip_id');
    return Redirect::to('/system-admin/trip-history/edit/'.$trip_id);
}

public function addTripHistoryDetails(){
    AdminManagerModel::addTripHistoryDetails();
    return Redirect::to('/system-admin/trip-history');
}

public function preTripSurvey(){
    $data['title']="StarsApp-Answer Pre Trip Inspection";
    $data['trip_steps']=AdminManagerModel::getAllTripInspectionSteps();
    return view('profile.add.pre-trip-survey',$data);
}

public function addPreTripSurvey(){
    $last_insert_id=AdminManagerModel::addPreTripDetails($_POST);
    AdminManagerModel::addPostTripDetails($last_insert_id); //This will add the post trip id as well.
    return Redirect::to('/system-admin/trip-history/add/'.$last_insert_id);
}

public function updatePostTripSurvey(){
    AdminManagerModel::updatePostTripDetails($_POST);
    $post_survey_id=Input::input('post_survey_id');
    return Redirect::to('/system-admin/post-trip-survey/'.$post_survey_id);
}

public function postTripSurvey($post_survey_id){
    $data['title']="StarsApp-Answer Post Trip Inspection";
    $data['post_survey_id']=$post_survey_id;
    $data['result']=AdminManagerModel::getTripInspectionById($post_survey_id);
    $data['trip_steps']=AdminManagerModel::getAllTripInspectionSteps();
    return view('profile.edit.post-trip-survey',$data);
}

public function viewPreTripSurvey($inspection_id){
    $data['title']="StarsApp-View Pre Trip Inspection";
    $data['result']=AdminManagerModel::getTripInspectionById($inspection_id);
    $data['trip_steps']=AdminManagerModel::getAllTripInspectionSteps();
    return view('profile.view.pre-trip-inspection',$data);
}

public function viewPostTripSurvey($inspection_id){
    $data['title']="StarsApp-View Post Trip Inspection";
    $data['result']=AdminManagerModel::getTripInspectionById($inspection_id);
    $data['trip_steps']=AdminManagerModel::getAllTripInspectionSteps();
    return view('profile.view.post-trip-inspection',$data);
}

public function deleteSingleEntity($page,$table,$primary_index,$id){

        AdminManagerModel::deleteSingleEntity($page,$table,$primary_index,$id);

        return Redirect::to("system-admin/$page");
}

//Threshold Problems
public function thresholdProblems(){
    $data['title']="StarsApp-Threshold Problems";
    $data['results']=AdminManagerModel::getAllThresholdProblems();
    return view('profile.threshold-problems',$data); 
}

public function addThresholdProblem(){
    AdminManagerModel::addThresholdProblemModel(Input::all());
    return Redirect::to("system-admin/threshold-problems");
}

public function updateThresholdProblem(){
    AdminManagerModel::updateThresholdProblemModel(Input::all());
    return Redirect::to("system-admin/threshold-problems");
}

//Route Types

public function routeTypes(){
    $data['title']="StarsApp-Route Types";
    $data['results']=AdminManagerModel::getAllRouteTypes();
    return view('profile.route-types',$data); 
}

public function addRouteType(){
    AdminManagerModel::addRouteTypeModel(Input::all());
    return Redirect::to("system-admin/route-types");
}

public function updateRouteType(){
    AdminManagerModel::updateRouteTypeModel(Input::all());
    return Redirect::to("system-admin/route-types");
}

}//Model Class Ends here.
