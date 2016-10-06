<?php
echo view('authentication.header',array('title'=>$title));
?>
<div class='container canteen'>
<?php if(Session::has('system_message')): ?>
<div class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo Session::get('system_message'); ?></div>
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
<input type='email' required='required' name='admin_email' id='canteen_email' class='form-control' autocomplete='off'>
<label>Password</label>
<input type='password' required='required' name='admin_password' id='canteen_password' class='form-control' autocomplete='off'>
<div style='text-align:center;padding-top:20px;'>

<span class='small' style='float:left'><input type='checkbox'> <font class='little_top'>Remember Me</font></span>
<a class='small' href='<?php echo Request::root(); ?>/forgotcredentials' style='float:right'>Forgot Password?</a><br><br>

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
