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
<h1 style="margin-top:50px;padding-left:0px">Forgot Credential ?</h1>
<p>Please enter your email id, our system will authenticate your email id, if your email is found genuine & is linked with our system administration then 
we will send a mail to your email id with password resetting instructions.</p>
<form method='post' action='check-forgot-credentials' style='width:50%'>
<label>Enter your e-mail address</label>
<input type='email' required='required' name='authenticate_admin_email' id='canteen_email' class='form-control' autocomplete='off'>
<br>
<button type='submit' name='authetication_admin_sub' style='clear:both' class='btn btn-success'>Submit</button>
</div>
<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>" />
</form>


</div>
</div> <!-- Container ends -->
<?php
echo view('authentication.footer');
?>
