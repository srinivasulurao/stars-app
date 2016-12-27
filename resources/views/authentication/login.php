<?php
echo view('authentication.header',array('title'=>$title));
?>
<div class='container canteen'>
<?php if(Session::has('system_message')):
$tick=(Session::get('system_message_type')=='success')?"<div class='system-message-success-tick'>&#x2713;</div>":"<div class='system-message-tick'>&#x2718;</div>";
?>
<div style='top:50px' class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo $tick.Session::get('system_message'); ?></div>
<?php
Session::forget('system_message');
Session::forget('system_message_type');
endif;
?>
<h1></h1>
<div class='loginBox well'>
<h3 style='text-align:center'><i class='glyphicon glyphicon-hand-right'></i> Sign in to your account</h3><hr>
<form method='post' action='doLogin'>
<label>Email</label>
<input type='email' required='required' name='admin_email' value='<?php echo $cookie_admin_email; ?>' id='canteen_email' class='form-control' autocomplete='off'>
<label>Password</label>
<input type='password' required='required' name='admin_password' value='<?php echo $cookie_admin_password; ?>' id='canteen_password' class='form-control' autocomplete='off'>
<div style='text-align:center;padding-top:20px;'>

<span class='small' style='float:left'><input type='checkbox' <?php echo $cookie_remember_me; ?> name='remember_me' value='1'> <font class='little_top'>Remember Me</font></span>
<a class='small' href='<?php echo Request::root(); ?>/forgot-credentials' style='float:right'>Forgot Password?</a><br>
<a class='small' href='<?php echo Request::root(); ?>/registration' style='float:right'>New User? Register Here</a><br>
<br>

<button type='submit' name='canteen_login' style='clear:both' class='btn btn-success'>Sign In</button>
</div>
<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>" />
</form>
</div>

</div>
</div> <!-- Container ends -->
<?php
echo view('authentication.footer');
?>
