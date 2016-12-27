
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
<div class='jumbotron'>
<h3><i class='glyphicon glyphicon-hand-right'></i> Register Here</h3><hr>
<form method='post' action='doRegistration'>

<label>Full Name</label>
 <div class="input-group">
 <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
<input type='text' required='required' name='display_name' value="<?php echo $cookie_reg_display_name; ?>" id='display_name' class='form-control' autocomplete='off'>
</div>

<label>Email</label>
<div class="input-group">
 <span class="input-group-addon">@</span>
<input type='email' required='required' name='admin_email' value="<?php echo $cookie_reg_email; ?>" id='canteen_email' class='form-control' autocomplete='off'>
</div>

<label>Password</label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
<input type='password' required='required' name='admin_password'  id='canteen_password' class='form-control' autocomplete='off'>
</div>

<label>Confirm Password</label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
<input type='password' required='required' name='confirm_admin_password'  id='canteen_password' class='form-control' autocomplete='off'>
</div>

<label>Admin Type</label>
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-registration-mark"></i></span>
<select required='required' name='redirection'  id='redirection' class='form-control' autocomplete='off'>
<option value='dashboard' <?php echo ($cookie_reg_redirection=="dashboard")?"selected='selected'":""; ?> >System Admin</option>
<option value="billing" <?php echo ($cookie_reg_redirection=="billing")?"selected='selected'":""; ?>>Billing Admin</option>cookie_
</select>
</div>
<br><br>


<button type='submit' name='register' style='clear:both' class='btn btn-success'>Sign Up</button>
</div>
<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>" />
</form>
</div>

</div>
</div> <!-- Container ends -->
<?php
echo view('authentication.footer');
?>
