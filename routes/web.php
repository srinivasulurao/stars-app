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

Route::get('/',array("uses"=>"StarsAppAuthentication@Index"));

Route::get('login',array("uses"=>"StarsAppAuthentication@Index"));
Route::get('forgot-credentials',array("uses"=>"StarsAppAuthentication@forgotCredentials"));
Route::get('reset-admin-password/{authentication_string}',array("uses"=>"StarsAppAuthentication@resetAdminPassword"));

Route::post('doLogin',array("uses"=>"StarsAppAuthentication@doLogin"));
Route::post('check-forgot-credentials',array("uses"=>"StarsAppAuthentication@checkForgotCredentials"));
Route::post('reset-admin-pass',array("uses"=>"StarsAppAuthentication@resetAdminPasswordDetails"));

####################################################################################
#################SYSTEM ADMIN PAGES ################################################
####################################################################################

//Dashboard pages.
Route::get('/system-admin/dashboard',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@dashboard"));

//Drivers pages
Route::get('/system-admin/drivers',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@drivers"));
Route::get('/system-admin/driver/edit/{driver_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@editDriver"));
Route::get('/system-admin/driver/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDriver"));
Route::post('/system-admin/edit-driver-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@editDriverDetails"));
Route::post('/system-admin/add-driver-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDriverDetails"));
Route::post('/system-admin/driver-mass-upload',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@driversMassUpload"));

//School pages
Route::get('/system-admin/schools',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Schools"));
Route::get('/system-admin/school/edit/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateSchool"));
Route::post('/system-admin/update-school-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateSchoolDetails"));
Route::get('/system-admin/school/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addSchool"));
Route::post('/system-admin/add-school-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addSchoolDetails"));


//Vehicle pages
Route::get('/system-admin/vehicles',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Vehicles"));
Route::get('/system-admin/vehicle/edit/{vehicle_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateVehicle"));
Route::post('/system-admin/update-vehicle-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateVehicleDetails"));
Route::get('/system-admin/vehicle/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addVehicle"));
Route::post('/system-admin/add-vehicle-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addVehicleDetails"));
Route::post('/system-admin/vehicle-mass-upload',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@vehiclesMassUpload"));


//Discipline Referral Pages.
Route::get('/system-admin/discipline-referrals',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@DisciplineReferrals"));
Route::get('/system-admin/discipline-referral/edit/{dr_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateDisciplineReferral"));
Route::post('/system-admin/update-discipline-referral-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateDisciplineReferralDetails"));
Route::get('/system-admin/discipline-referral/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDisciplineReferral"));
Route::post('/system-admin/add-discipline-referral-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addDisciplineReferralDetails"));

//Logout Routing.
Route::get('/system-admin/logout',array("uses"=>"StarsAppAuthentication@Logout"));

//Incidents Pages.
Route::get('/system-admin/incidents',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@Incidents"));
Route::get('/system-admin/incident/edit/{incident_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateIncident"));
Route::post('/system-admin/update-incident-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateIncidentDetails"));
Route::get('/system-admin/incident/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addIncident"));
Route::post('/system-admin/add-incident-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addIncidentDetails"));

//Seating Arrangements
Route::get('/system-admin/seating-charts',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@SeatingCharts"));
Route::get('/system-admin/seating-chart/view/{sc_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@viewSeatingChart"));

//Route-Map Pages.
Route::get('/system-admin/route-maps',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@RouteMaps"));
Route::get('/system-admin/route-map/edit/{route_map_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateRouteMap"));
Route::post('/system-admin/update-route-map-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateRouteMapDetails"));
Route::get('/system-admin/route-map/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addRouteMap"));
Route::post('/system-admin/add-route-map-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addRouteMapDetails"));

//Maintainance Pages.
Route::get('/system-admin/maintenance-history',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@MaintenanceHistory"));
Route::get('/system-admin/maintenance-history/edit/{mh_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateMaintenanceHistory"));
Route::post('/system-admin/update-maintenance-history-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateMaintenanceHistoryDetails"));
Route::get('/system-admin/maintenance-history/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addMaintenanceHistory"));
Route::post('/system-admin/add-maintenance-history-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addMaintenanceHistoryDetails"));

//Forms.
Route::get('/system-admin/forms',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@forms"));
Route::get('/system-admin/form/edit/{form_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateForm"));
Route::get('/system-admin/form/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addForm"));
Route::post('/system-admin/update-form-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateFormDetails"));
Route::post('/system-admin/add-form-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addFormDetails"));

//Inspection Steps.
Route::get('/system-admin/inspection-steps',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@inspectionSteps"));
Route::get('/system-admin/inspection-step/edit/{inspection_step_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateInspectionStep"));
Route::get('/system-admin/inspection-step/add',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addInspectionStep"));
Route::post('/system-admin/update-inspection-step-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateInspectionStepDetails"));
Route::post('/system-admin/add-inspection-step-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addInspectionStepDetails"));

//Trip History.
Route::get('/system-admin/trip-history',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@tripHistory"));
Route::get('/system-admin/trip-history/edit/{th_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateTripHistory"));
Route::get('/system-admin/trip-history/add/{inspection_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addTripHistory"));
Route::post('/system-admin/update-trip-history-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateTripHistoryDetails"));
Route::post('/system-admin/add-trip-history-details',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addTripHistoryDetails"));

//Add Trip Details, this is little bit tricky while integrating the trip history/
Route::get('/system-admin/pre-trip-survey',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@preTripSurvey"));
Route::post('/system-admin/add-pre-trip-survey',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addPreTripSurvey"));
Route::get('/system-admin/post-trip-survey/{post_survey_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@postTripSurvey"));
Route::post('/system-admin/update-post-trip-survey',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updatePostTripSurvey"));
Route::get('/system-admin/view-pre-trip-inspection/{id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@viewPreTripSurvey"));
Route::get('/system-admin/view-post-trip-inspection/{id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@viewPostTripSurvey"));

//Threshold Problems
Route::get('/system-admin/threshold-problems',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@thresholdProblems"));
Route::post('/system-admin/addThresholdProblem',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addThresholdProblem"));
Route::post('/system-admin/updateThresholdProblem',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateThresholdProblem"));

//Vehicle Problem
Route::post('/system-admin/addVehicleProblem',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addVehicleProblem"));

//Offense
Route::post('/system-admin/add-offense',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addOffense"));

//Route Types
Route::get('/system-admin/route-types',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@routeTypes"));
Route::post('/system-admin/addRouteType',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@addRouteType"));
Route::post('/system-admin/updateRouteType',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@updateRouteType"));
Route::get('/uploads/{pdf_folder}/{pdf_file}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@viewPdfFile"));


//Delete Entry from Table & Do proper Redirection
Route::get('/system-admin/delete/{page}/{table}/{primary_index}/{id}',array("middleware","Role:StarsApp","uses"=>"StarsAppProfileManager@deleteSingleEntity"));

#############################################################################################
//##############################Billing Stuff Added Here  ###################################
#############################################################################################

//Billing 
Route::get('billing-admin/dashboard',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@invoices"));
Route::get('billing-admin/pricing',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@pricing"));
Route::get('billing-admin/pricing/edit/{district_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@setPricing"));
Route::post('billing-admin/save-pricing',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@savePricing"));
Route::post('billing-admin/add-district',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@addDistrict"));
Route::get('billing-admin/delete/{page}/{table}/{primary_id}/{entity_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppBillingManager@deleteEntity"));

#############################################################################################
//##############################Webservice for Mobile App.###################################
#############################################################################################
Route::get('/web-api/getEntityById/{entity}/{entity_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getEntityById"));
Route::get('/web-api/login-driver/{username}/{password}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@loginDriver"));
Route::post('/web-api/create-driver',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@createDriver"));
Route::post('/web-api/update-driver',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@updateDriver"));
Route::get('/web-api/getAllEntities/{entity}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getAllEntities"));
Route::post('/web-api/addPreInspection',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addPreInspection"));
Route::post('/web-api/addTripHistory',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addTripHistory"));      # Not being used
Route::post('/web-api/updatePostInspection',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@updatePostInspection"));


Route::get('/web-api/getDriverVehiclesById/{driver_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getDriverVehiclesById"));
Route::get('/web-api/getAllStudentsBySchool/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getAllStudentsBySchool"));
Route::get('/web-api/getVehicleHistoryById/{school_id}/{vehicle_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getVehicleHistoryById"));
Route::get('/web-api/getTripHistoryByDriver/{driver_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getTripHistoryByDriver"));

Route::post('/web-api/addTrip',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addTrip"));
Route::put('/web-api/updateTrip/{trip_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@updateTrip"));
Route::post('/web-api/addPreTripInspection',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addPreTripInspection"));

Route::get('/web-api/getFormsBySchool/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getFormBySchool"));
Route::get('/web-api/getRouteMapsBySchool/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getRouteMapsBySchool"));

Route::post('/web-api/addMaintenanceIssue/',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addMaintenanceIssue"));
Route::post('/web-api/addDisciplineReferral/',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addDisciplineReferral"));

Route::get('/web-api/getEntityBySchool/{entity}/{school_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getEntityBySchool"));
Route::get('/web-api/getEntityByCondition/{entity}/{col}/{col_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getEntityByCondition"));

Route::get('/web-api/forgot-password/{username}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@forgotPassword"));
Route::post('/web-api/reset-password/',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@resetPassword"));

Route::get('/web-api/seating-chart/{route_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getSeatingChart"));

Route::post('/web-api/add-special-trip-history',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@addSpecialTripHistory"));  

Route::get('/web-api/latest-odometer-reading/{vehicle_id}',array("middleware","Role:StarsApp","uses"=>"StarsAppWebservice@getLatestOdometerReading"));
