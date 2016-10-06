<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

Route::get('/',array("middleware","Role:StarsApp","uses"=>"StarsAppAuthentication@Index"));

Route::get('login',array("middleware","Role:StarsApp","uses"=>"StarsAppAuthentication@Index"));

Route::post('doLogin',array("middleware","Role:StarsApp","uses"=>"StarsAppAuthentication@doLogin"));

Route::get('/system-admin/dashboard',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Dashboard"));

//Drivers pages
Route::get('/system-admin/drivers',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@drivers"));
Route::get('/system-admin/driver/edit/{driver_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@editDriver"));
Route::get('/system-admin/driver/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDriver"));
Route::post('/system-admin/edit-driver-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@editDriverDetails"));
Route::post('/system-admin/add-driver-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDriverDetails"));

//School pages
Route::get('/system-admin/schools',array("middleware","Role:StarsApp","middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Schools"));
Route::get('/system-admin/school/edit/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateSchool"));
Route::post('/system-admin/update-school-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateSchoolDetails"));
Route::get('/system-admin/school/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addSchool"));
Route::post('/system-admin/add-school-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addSchoolDetails"));

Route::get('/system-admin/vehicles',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Vehicles"));

//Discipline Referral Pages.
Route::get('/system-admin/discipline-referrals',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@DisciplineReferrals"));
Route::get('/system-admin/discipline-referral/edit/{dr_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateDisciplineReferral"));
Route::post('/system-admin/update-discipline-referral-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateDisciplineReferralDetails"));
Route::get('/system-admin/discipline-referral/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDisciplineReferral"));
Route::post('/system-admin/add-discipline-referral-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDisciplineReferralDetails"));

//Logout Routing.
Route::get('/system-admin/logout',array("middleware","Role:StarsApp","uses"=>"StarsAppAuthentication@Logout"));

//Incidents Pages.
Route::get('/system-admin/incidents',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Incidents"));
Route::get('/system-admin/incident/edit/{incident_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateIncident"));
Route::post('/system-admin/update-incident-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateIncidentDetails"));
Route::get('/system-admin/incident/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addIncident"));
Route::post('/system-admin/add-incident-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addIncidentDetails"));

//Route-Map Pages.
Route::get('/system-admin/route-maps',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@RouteMaps"));
Route::get('/system-admin/route-map/edit/{route_map_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateRouteMap"));
Route::post('/system-admin/update-route-map-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateRouteMapDetails"));
Route::get('/system-admin/route-map/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addRouteMap"));
Route::post('/system-admin/add-route-map-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addRouteMapDetails"));

