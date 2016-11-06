<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Maintenance'))->render();
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
        <h1>Add Maintenance History</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-maintenance-history-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Vehicle', 'Vehicle'); ?>
            <?php echo Form::select('vehicle_id',getVehiclesDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Driver', 'Driver'); ?>
            <?php echo Form::select('driver_id',getDriversDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Problem', 'Problem'); ?>
            <?php echo Form::select('problem',getThresholdDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Problem Time','Problem Time'); ?>
            <?php echo Form::text('problem_occured_time','', array('id'=>'problem_occured_time','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Problem Location',"Problem Location"); ?>
            <?php echo Form::text('problem_location','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Comments', 'Comments'); ?>
            <?php echo Form::textarea('comments','',array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <br>

            
            <?php echo Form::token(); ?>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>


<script>
    $('#problem_occured_time').appendDtpicker({
        "autodateOnStart": false
    });
</script>