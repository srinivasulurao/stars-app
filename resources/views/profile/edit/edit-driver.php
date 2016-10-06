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
            <?php echo Form::label('email', 'E-Mail Address'); ?>
            <?php echo Form::text('email', $result->email,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Total Experience', 'Total Experience'); ?>
            <?php echo Form::text('total_exp', $result->total_exp,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('About Driver', 'About Driver'); ?>
            <?php echo Form::textarea('about_driver', $result->about_driver,array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('City', 'City'); ?>
            <?php echo Form::text('city', $result->city,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('State', 'State'); ?>
            <?php echo Form::text('state', $result->state,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Address', 'Address'); ?>
            <?php echo Form::textarea('address', $result->address,array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::text('district', $result->district,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),$result->school_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Phone', 'Phone'); ?>
            <?php echo Form::text('phone', $result->phone,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Picture', 'Picture'); ?>
            <?php echo Form::file('profile_pic'); ?>
            <img style="height:70px;" class="thumbnail" src="<?php echo str_replace("/public","",url($result->profile_pic)); ?>" />



            <?php echo Form::hidden('driver_id',$driver_id); ?>
            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
