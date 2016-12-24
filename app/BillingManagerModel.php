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
}
