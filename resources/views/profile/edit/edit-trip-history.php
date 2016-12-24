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
        <h1>Edit Trip Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/update-trip-history-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Route', 'Route'); ?>
            <?php echo Form::select('route_id',getRoutesDropDown(),$result->route_id, array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Driver', 'Driver'); ?>
            <?php echo Form::select('driver_id',getDriversDropDown(),$result->driver_id, array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Total Distance', 'Total Distance'); ?>
            <?php echo Form::number('total_distance',$result->total_distance, array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Total Riders', 'Total Riders'); ?>
            <?php echo Form::number('total_riders',$result->total_riders, array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Pre Trip Result', 'Pre Trip Result'); ?>
            <?php echo Form::select('pre_trip',getInspectionResultDropDown(),$result->pre_trip,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Post Trip Result', 'Post Trip Result'); ?>
            <?php echo Form::select('post_trip',getInspectionResultDropDown(),$result->post_trip,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Trip Time','Trip Time'); ?>
            <?php echo Form::text('trip_time',date("Y-m-d H:i",strtotime($result->trip_time)), array('id'=>'trip_time','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Trip Status', 'Trip Status'); ?>
            <?php echo Form::select('trip_status',getTripStatusDropDown(),$result->trip_status, array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Route Type', 'Route Type'); ?>
            <?php echo Form::select('route_type',getRouteTypeDropDown(),$result->route_type,array('class'=>"form-control","required"=>"required")); ?>

            <?php echo Form::hidden('trip_id',$trip_id); ?>
            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>
            <a target='_blank' href='<?php echo url('system-admin/post-trip-survey/'.$result->post_inspection_id); ?>' class='btn btn-info' >Post Inspection</a>

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