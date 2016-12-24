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
      $data['results']=AdminManagerModel::getAllDrivers();
      return view('billing.invoices',$data);

    }

    public static function pricing(){
    	  $data=array();
	      $data['title']="StarsApp-Set Pricing";
	      $data['results']=BillingManagerModel::getAllDistricts();
	      return view('billing.pricing',$data);
    }
}
