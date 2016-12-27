<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use App\Http\Controllers\Controller;

use App\AuthenticationModel;
use App\AdminManagerModel;
use App\BillingManagerModel;

use Input;
use Session;
use Redirect;
use Response;


class StarsAppBillingManager extends Controller
{
    //

    public static function invoices(){

      $data=array();
      $data['title']="StarsApp-Billing Backend";
      $data['results']=BillingManagerModel::getAllInvoices();
      return view('billing.invoices',$data);

    }

    public static function generateInvoice(){
      BillingManagerModel::generateInvoice();
      return Redirect::to('billing-admin/invoices');
    }

    public static function pricing(){
    	  $data=array();
	      $data['title']="StarsApp-Pricing";
	      $data['results']=BillingManagerModel::getAllDistricts();
	      return view('billing.pricing',$data);
    }

    public static function setPricing($district_id){
        ////create pricing entries, if it doesn't exists
        BillingManagerModel::createPricingEntries($district_id);
        $data['title']="StarsApp-Set Pricing";
        $data['district_id']=$district_id;
        $data['result']=BillingManagerModel::getDistrictPricingData($district_id);
        return view('billing.edit.set-pricing',$data);
    }

    public static function savePricing(){
        $post_data=Input::all();
        $data['result']=BillingManagerModel::saveDistrictPricing($post_data);
        return Redirect::to("billing-admin/pricing/edit/".Input::get('district_id'));
    }

    public function deleteEntity($page,$table,$primary_index,$id){

        AdminManagerModel::deleteSingleEntity($page,$table,$primary_index,$id);

        return Redirect::to("billing-admin/$page");
    }

    public function addDistrict(){
        BillingManagerModel::addDistrict();
        return Redirect::to("billing-admin/pricing");
    }




}//Billing Controller Class Ends here.
