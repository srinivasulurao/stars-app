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
    //

    public function dashboard(){
      $data=array();
      $data['title']="StarsApp-Login";
      return view('profile.dashboard',$data);
    }

    public function drivers(){
      $data=array();
      $data['title']="StarsApp-Drivers";
      $data['results']=AdminManagerModel::getAllDrivers();
      return view('profile.drivers',$data);
    }

    public function schools(){
        $data['title']="StarsApp-Schools";
        $data['results']=AdminManagerModel::getAllSchools();
        return view('profile.schools',$data);
    }

    public function vehicles(){
        $data['title']="StarsApp-Vehicles";
        $data['results']=AdminManagerModel::getAllVehicles();
        return view('profile.vehicles',$data);
    }

    public function disciplineReferrals(){
        $data['title']="StarsApp-Discipline Referrals";
        $data['results']=AdminManagerModel::getAllDisciplineReferrals();
        return view('profile.discipline-referrals',$data);
    }

    public function incidents(){
        $data['title']="StarsApp-Incidents";
        $data['results']=AdminManagerModel::getAllIncidents();
        return view('profile.incidents',$data);
    }

    public function routeMaps(){
        $data['title']="StarsApp-Route Maps";
        $data['results']=AdminManagerModel::getAllRoutes();
        return view('profile.route-maps',$data);
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

    public function updateVehicle($vehicle_id){
        $data['title']="StarsApp-Update Discipline Referral";
        $data['result']=AdminManagerModel::getVehicleById($vehicle_id);
        $data['vehicle_id']=$vehicle_id;
        return view('profile.edit.edit-vehicle',$data);

    }

    public function updateVehicleDetails(){
        AdminManagerModel::updateVehicleDetails();
        $vehicle_id=Input::get('vehicle_id');
        return Redirect::to('/system-admin/vehicle/edit/'.$vehicle_id);
    }

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
}
