<?php

function debug($arrayObject){
    echo "<pre>";
    print_r($arrayObject);
    echo "</pre>";
}

function getSchoolsDropDown(){
    $results=DB::table("schools")->get();
    $schools=array();
    $schools['']="--SELECT SCHOOL--";
    foreach($results as $result)
    $schools[$result->school_id]=$result->school_name;

    return $schools;
}

function getDistrictsDropDown(){
    $results=DB::table("districts")->get();
    $districts=array();
    $districts['']="--SELECT DISTRICT--";
    foreach($results as $result)
        $districts[$result->district_id]=$result->district_name;

    return $districts;
}

function getVehiclesDropDown(){
    $results=DB::table("vehicles")->get();
    $vehicles=array();
    $vehicles['']="--SELECT VEHICLE--";
    foreach($results as $result)
        $vehicles[$result->vehicle_id]=$result->vehicle_name;

    return $vehicles;
}

function site_url($input=""){
        return Request::root().$input;
}

function redirector($input){
    $redirectionUrl=Request::root().$input;
    echo "<script>window.location='$redirectionUrl'</script>";
}

function getDriversDropDown(){
    $results=DB::table("drivers")->get();

    $drivers=array();
    $drivers['']="--SELECT DRIVER--";
    foreach($results as $result):
        $drivers[$result->driver_id]=$result->first_name." ".$result->last_name;
    endforeach;
    return $drivers;
}

function getRoutesDropDown(){
    $results=DB::table("routes_maps")->get();
    $list=array();
    $list['']="--SELECT DRIVER--";
    foreach($results as $result):
        $list[$result->route_id]=$result->route_name;
    endforeach;
    return $list;
}
function getInspectionTypeDropDown(){
    $inspection_type=array();
    $inspection_type['']="--SELECT INSPECTION TYPE--";
    $inspection_type['pre']="PRE";
    $inspection_type['post']="POST";
    return $inspection_type;
}
function getTripStatusDropDown(){
    $list=array();
    $list['']="--SELECT TRIP STATUS--";
    $list['complete']="COMPLETE";
    $list['ongoing']="GOING ON";
    $list['incomplete']="INCOMPLETE";
    return $list;
}

function getOdometerDropDown(){
    $list=array();
    $list['']="--SELECT ODOMETER RANGE--";
    $results=DB::table("odometer_range")->get();
    foreach($results as $result):
        $list[$result->odometer_id]=$result->range_value;
    endforeach;
    return $list;
}

function getRouteTypeDropDown(){
    $list=array();
    $list['']="--SELECT ROUTE TYPE--";
    $results=DB::table("route_types")->get();
    foreach($results as $result):
        $list[$result->id]=$result->type;
    endforeach;
    return $list;
}

function getInspectionResultDropDown(){
    $list=array();
    $list['']="--SELECT RESULT--";
    $list['pass']="PASS";
    $list['fail']="FAIL";
    return $list;
}

function getThresholdDropDown(){
    $results=DB::table('school_vehicle_threshold')->get();

    $thresholdProblems=array();

    $thresholdProblems['']="--SELECT PROBLEM--";
    foreach($results as $result):
        $thresholdProblems[$result->threshold_id]=$result->threshold;
    endforeach;

    return $thresholdProblems;

}

function vehicleName($vehicle_id){
    if(DB::table('vehicles')->where('vehicle_id',$vehicle_id)->count()){
    $result=DB::table('vehicles')->where('vehicle_id',$vehicle_id)->first();
    return $result->vehicle_name;
    }
    else{
        return "";
    }
}
function schoolName($school_id){
    if(DB::table('schools')->where('school_id',$school_id)->count()){
    $result=DB::table('schools')->where('school_id',$school_id)->first();
    return $result->school_name;
    }
    else{
        return "";
    }
}

function driverName($driver_id){
    
    if(DB::table('drivers')->where('driver_id',$driver_id)->count()){
    $result=DB::table('drivers')->where('driver_id',$driver_id)->first();
    return $result->first_name." ".$result->last_name;
    }
    else{
        return "";
    }
}

function districtName($district_id){

    if(DB::table('districts')->where('district_id',$district_id)->count()){
    $result=DB::table('districts')->where('district_id',$district_id)->first();
    return $result->district_name;
    }
    else{
        return "";
    }
}

function thresholdProblem($threshold_id){

    if(DB::table('school_vehicle_threshold')->where('threshold_id',$threshold_id)->count()){
    $result=DB::table('school_vehicle_threshold')->where('threshold_id',$threshold_id)->first();
    return $result->threshold;
    }
    else{
        return "";
    }
}

function routeName($route_id){

    if(DB::table('routes_maps')->where('route_id',$route_id)->count()){
    $result=DB::table('routes_maps')->where('route_id',$route_id)->first();
    return $result->route_name;
    }
    else{
        return "";
    }
}

function odometerReading($odometer_id){

     if(DB::table('odometer_range')->where('odometer_id',$odometer_id)->count()){
    $result=DB::table('odometer_range')->where('odometer_id',$odometer_id)->first();
    return $result->range_value;
    }
    else{
        return "";
    }
}

function inspectionStepName($step_id){

    if(DB::table('trip_inspection_steps')->where('inspection_step_id',$step_id)->count()){
    $result=DB::table('trip_inspection_steps')->where('inspection_step_id',$step_id)->first();
    return $result->step;
    }
    else{
        return "";
    }
}
?>