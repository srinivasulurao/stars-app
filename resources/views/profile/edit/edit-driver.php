<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Drivers'))->render();
        ?>
    </div>
    <!-- Entire content to be shown here -->
    <div class='col-md-10'>
        <?php if(Session::has('system_message')):
            $tick=(Session::get('system_message_type')=='success')?"<div class='system-message-success-tick'>&#x2713;</div>":"<div class='system-message-tick'>&#x2718;</div>";
            ?>
            <div class="system-message bg-<?php echo Session::get('system_message_type'); ?>"><?php echo $tick.Session::get('system_message'); ?></div>
            <?php
            Session::forget('system_message');
            Session::forget('system_message_type');
        endif;

        //debug($accountDetail);
        ?>
        <h1>Edit Driver Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/edit-driver-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('First Name', 'First Name'); ?>
            <?php echo Form::text('first_name', $result->first_name,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Last Name', 'Last Name'); ?>
            <?php echo Form::text('last_name', $result->last_name,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Username', 'Username'); ?>
            <?php echo Form::text('username',$result->username,array('class'=>"form-control")); ?>
            <!--
            <?php echo Form::label('email', 'E-Mail Address'); ?>
            <?php echo Form::text('email', $result->email,array('class'=>"form-control")); ?>
            <?php echo Form::label('Password', 'Password'); ?>
            <?php echo Form::password('password',array('class'=>"form-control","autocomplete"=>"off")); ?>
            <?php echo Form::label('Total Experience', 'Total Experience'); ?>
            <?php echo Form::text('total_exp', $result->total_exp,array('class'=>"form-control")); ?>
            <?php echo Form::label('City', 'City'); ?>
            <?php echo Form::text('city', $result->city,array('class'=>"form-control")); ?>
            <?php echo Form::label('State', 'State'); ?>
            <?php echo Form::text('state', $result->state,array('class'=>"form-control")); ?>
            <?php echo Form::label('Address', 'Address'); ?>
            <?php echo Form::textarea('address', $result->address,array('class'=>"form-control","rows"=>5)); ?>
            -->
            <?php echo Form::label('Driver Description', 'Driver Description'); ?>
            <?php echo Form::select('driver_description',getDriverDescriptionDropDown(),$result->driver_description,array('class'=>"form-control")); ?>
            <?php echo Form::label('Security Question', 'Security Question'); ?>
            <?php echo Form::select('security_question',securityQuestionsDropDown(),$result->security_question,array('class'=>"form-control")); ?>
            <?php echo Form::label('Security Answer', 'Security Answer'); ?>
            <?php echo Form::text('security_answer', $result->security_answer,array('class'=>"form-control")); ?>

            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::select('district_id',getDistrictsDropDown(),$result->district_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Campus', 'Campus'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),$result->school_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Phone', 'Phone'); ?>
            <?php echo Form::text('phone', $result->phone,array('class'=>"form-control")); ?>
            <?php echo Form::label('Picture', 'Picture'); ?>
            <?php echo Form::file('profile_pic');?>
            <?php if($result->profile_pic): ?>
            <img style="height:70px;" class="thumbnail" src="<?php echo str_replace("/public","",url($result->profile_pic)); ?>" />
            <?php endif; ?>


            <?php echo Form::hidden('driver_id',$driver_id); ?>
            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
