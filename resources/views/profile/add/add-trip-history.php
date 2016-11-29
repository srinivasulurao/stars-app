<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Trip History'))->render();
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
        <h1>Add Trip Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-trip-history-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Route', 'Route'); ?>
            <?php echo Form::select('route_id',getRoutesDropDown(),'', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Driver', 'Driver'); ?>
            <?php echo Form::select('driver_id',getDriversDropDown(),'', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Total Distance', 'Total Distance'); ?>
            <?php echo Form::number('total_distance','', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Total Riders', 'Total Riders'); ?>
            <?php echo Form::number('total_riders','', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Pre Trip Result', 'Pre Trip Result'); ?>
            <?php echo Form::select('pre_trip',getInspectionResultDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Post Trip Result', 'Post Trip Result'); ?>
            <?php echo Form::select('post_trip',getInspectionResultDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Trip Time','Trip Time'); ?>
            <?php echo Form::text('trip_time','', array('id'=>'trip_time','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Trip Status', 'Trip Status'); ?>
            <?php echo Form::select('trip_status',getTripStatusDropDown(),'', array('class'=>"form-control","required"=>"required")); ?>
            
            
            <?php echo Form::hidden('pre_inspection_id',$pre_inspection_id); ?>
            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>

<script>
    $('#trip_time').appendDtpicker({
        "autodateOnStart": false
    });
</script>