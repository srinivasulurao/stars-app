<?php

namespace App\Http\Middleware;

use Closure;
use Session;
use Redirect;

class SystemAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
       
       //Laravel sessions are always active in middlewares.
       //remove Non-logged in users from this page.
      

       $session=Session::all();
       
           if(isset($session[0])){
              $admin_credentials=$session[0];
              Session::put('admin_id',$admin_credentials->admin_id);
              
           }
           
       
        return $next($request);
    }
}
