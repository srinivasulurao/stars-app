<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<?php if(Session::has('system_message')):
$tick=(Session::get('system_message_type')=='success')?"<div class='system-message-success-tick'>&#x2713;</div>":"<div class='system-message-tick'>&#x2718;</div>";
?>
<div class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo $tick.Session::get('system_message'); ?></div>
<?php
Session::forget('system_message');
Session::forget('system_message_type');
endif;
?>
<h1>Account Details</h1>
<div class='col-md-3 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'My Account'))->render();
?>
</div>
<!-- Entire content to be shown here -->
<div class='col-md-6'>
<form method="post" action="updateAccountDetails" enctype="multipart/form-data">
<label>Company/Franchise Name:</label>
<input type='text' name='name' id='name' required='required' class="form-control" value='<?php echo $accountDetail->name; ?>'>
<label>Email Id:</label>
<input type='text' name='email' disabled="disabled" id='email' required='required' class="form-control" value='<?php echo $accountDetail->email; ?>'>
<a href='javascript:void(0)' class='changePassword code'>Change Password</a><br>
<div class='changePasswordDiv'>
  <label>Password:</label>
  <input type='password' name='password' id='password' class='form-control' >
  <label>Confirm Password:</label>
  <input type='password' name='confirm-password' id='confirm-password' class='form-control' >
</div>
<label>Mobile:</label>
<input type='text' name='mobile' id='mobile' required='required' class="form-control" value='<?php echo $accountDetail->mobile; ?>'>
<label>Address:</label>
<textarea type='text' name='address' id='address' required='required' class="form-control"><?php echo $accountDetail->address; ?></textarea>
<label>City:</label>
<input type='text' name='city' id='city' required="required" class="form-control" value='<?php echo $accountDetail->city; ?>'>
<label>State:</label>
<input type='text' name='state' id='state' required='required' class='form-control' value="<?php echo $accountDetail->state; ?>">
<label>Company Logo</label>
<input type='file' id='company_logo' name='company_logo' class='form-control'>
<label>Company Unique Code</label><br>
<input type='text' id='canteen_secret_code' disabled="disabled" name='canteen_secret_code' required="required" value='@<?php echo $accountDetail->canteen_secret_code; ?>' class='form-control' style='width:400px;display:inline-block'> &nbsp <input type='button' style="display:none" class='btn btn-info' onclick='generateCanteenCode()' value='Generate Code'>
<div style='text-align:center;margin-top:10px;'>
<input type='hidden' name='_token' value='<?php echo csrf_token(); ?>'>
<input type='submit' name='sub_myaccount' id='sub_myaccount' value="SAVE DETAILS" class='btn btn-success'>
</div>
</form>
</div>


</div> <!-- Container ends -->
<?php
echo view('profile.footer');
?>
