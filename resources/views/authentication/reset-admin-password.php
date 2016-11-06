<?php
echo view('authentication.header',array('title'=>$title));
?>
<div class='container canteen'>
<?php if(Session::has('system_message')):
$tick=(Session::get('system_message_type')=='success')?"<div class='system-message-success-tick'>&#x2713;</div>":"<div class='system-message-tick'>&#x2718;</div>";
?>
<div style='margin-top:25px' class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo $tick.Session::get('system_message'); ?></div>
<?php
Session::forget('system_message');
Session::forget('system_message_type');
endif;
?>
<?php 
if($authentication_valid):
?>	
<h1 style="margin-top:50px;padding-left:0px">Reset Password</h1>
<p>Please enter your new password here.</p>
<form method='post' action='<?php echo url('reset-admin-pass'); ?>' style='width:50%'>
<label>New Password</label>
<input type='password' required='required' name='reset_password1' class='form-control' autocomplete='off'>
<label>Confirm Password</label>
<input type='password' required='required' name='reset_password2'  class='form-control' autocomplete='off'><br>
<button type='submit' name='submit' style='clear:both' class='btn btn-success'>Submit</button>
<input type='hidden' name='authentication_string'  value="<?php echo $authentication_string; ?>" />
<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>" />
</form>
<?php endif; ?>

</div>
</div> <!-- Container ends -->
<?php
echo view('authentication.footer');
?>
