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
?>