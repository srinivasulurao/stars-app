<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Discipline Referrals'))->render();
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
        <h1>Add Discipline Referral Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-discipline-referral-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Student Name', 'Student Name'); ?>
            <?php echo Form::text('student_name','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Driver', 'Driver'); ?>
            <?php echo Form::select('driver_id',getDriversDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Vehicle', 'Vehicle'); ?>
            <?php echo Form::select('vehicle_id',getVehiclesDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Offense', 'Offense'); ?>
            <?php echo Form::text('offence','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Offense Time', 'Offense Time'); ?>
            <?php echo Form::text('offence_time','',array('class'=>"form-control","required"=>"required","id"=>"offence_time")); ?>
            <?php echo Form::label('Offense Location', 'Offense Location'); ?>
            <?php echo Form::text('offence_location','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Comments', 'Comments'); ?>
            <?php echo Form::textarea('comments','',array('class'=>"form-control","required"=>"required")); ?><br>


            <?php echo Form::token(); ?>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>

<script>
    $('#offence_time').appendDtpicker({
        "autodateOnStart": false
    });
</script>
