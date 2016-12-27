<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Http\Request;
use App\Http\Requests;
use DB;
use Session;
use Redirect;
use Input;


class BillingManagerModel extends Model
{
    //

    public static function getAllDistricts(){
        $results=DB::table('districts')->get();
        return $results;
    }

    public static function getAllInvoices(){
        $results=DB::table('invoice')->get();
        return $results;
    }

    public static function createPricingEntries($district_id){
       $results=DB::table('schools')->where('district_id',$district_id)->get();
        //debug($results);

        foreach($results as $key):
            $school_exist=DB::table('pricing')->where('school_id',$key->school_id)->count();
            if(!$school_exist) {
                $empty_pricing_entry=array();
                $empty_pricing_entry['school_id']=$key->school_id;
                $empty_pricing_entry['district_id']=$key->district_id;
                DB::table('pricing')->insert($empty_pricing_entry);

            }
        endforeach;

        //Check District Exists or not, if not then create empty invoice entry for district.
        $district_exist=DB::table('invoice_address')->where('district_id',$key->district_id)->count();

        if(!$district_exist):
            $da=array();
            $da['district_id']=$district_id;
            DB::table('invoice_address')->insert($da);
        endif;    
    }

    public static function generateInvoice(){
        try {
           $month=date("F");
           $current_month=date("Y-m-d",time());

           //Delete all the invoice with the current month.
           DB::table('invoice')->where("invoice_date",$current_month)->delete();

           // $districts=self::getAllDistricts();
           //  foreach($districts as $district):
           //  $details['district_id']=$district->district_id;    
           //  $details['invoice_date']=$current_month;
           //  $details['po_number']="XXXXXXX";
           //  $details['email_address']=rand(1,10000000000)@xyz.com;
           //  $details['payment_with']="payment_order";
           //  $details['trea_member']="No"; // Default Member;
           //  $details['']
           //  DB:table('invoice')->insert($details);
           //  endforeach;
        

            Session::put('system_message',"Invoice for current month <span class='label label-success'>$month</span> has been generated successfully !");
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }

    public static function getDistrictPricingData($district_id){
        $districtPricingData=DB::table('districts')->where('district_id',$district_id)->first();
        $underSchoolPricing=DB::table('pricing')->where('district_id',$district_id)->get();
        $districtPricingData->pricing=$underSchoolPricing;
        //debug($districtPricingData);
        return $districtPricingData;
    }

    public static function saveDistrictPricing($post_data){

        try {

        //First Save the District Data
            $details=array();
            $details['district_name']=Input::input('district_name');
            $details['state']=Input::input('state');
            DB::table('districts')->where('district_id',$post_data['district_id'])->update($details);

        // Now Save the Pricing Data
            foreach($post_data['pricing'] as $pricing_id=>$pricing_value):
                DB::table('pricing')->where('pricing_id',$pricing_id)->update($pricing_value);
            endforeach;

            Session::put('system_message','Pricing Details Saved Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }

        //
    }

    public static  function addDistrict(){
        try {

            //First Save the District Data
            $details=array();
            $details['district_name']=Input::input('district_name');
            $details['state']=Input::input('state');
            DB::table('districts')->insert($details);

            Session::put('system_message','New District Added Successfully !');
            Session::put('system_message_type','success');
        } catch (\Illuminate\Database\QueryException $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        } catch (\Exception $e) {
            Session::put('system_message',$e->getMessage());
            Session::put('system_message_type','danger');
        }
    }


}//Class ends here
