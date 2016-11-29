<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Route Info'))->render();
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
        <h1>Edit Route Info Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/update-route-map-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Route Name', 'Route Name'); ?>
            <?php echo Form::text('route_name', $result->route_name,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),$result->school_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::select('district_id',getDistrictsDropDown(), $result->district_id,array('class'=>"form-control","required"=>"required")); ?>
            <!--
            <?php echo Form::label('Route Start Latitude', 'Route Start Latitude'); ?>
            <?php echo Form::text('route_start_latitude', $result->route_start_latitude,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Route Start Longitude', 'Route Start Longitude'); ?>
            <?php echo Form::text('route_start_longitude', $result->route_start_longitude,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Route End Latitude', 'Route End Latitude'); ?>
            <?php echo Form::text('route_end_latitude', $result->route_end_latitude,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Route End Longitude', 'Route End Longitude'); ?>
            <?php echo Form::text('route_end_longitude', $result->route_end_longitude,array('class'=>"form-control","required"=>"required")); ?>
            -->
            <?php echo Form::label('Route Type', 'Route Type'); ?>
            <?php echo Form::select('route_type',getRouteTypeDropDown(),$result->route_type,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Seat Arrangement CSV', 'Seat Arrangement CSV'); ?>
            <?php echo Form::file('seat_arrangement_csv'); ?>
            <?php if($result->seat_arrangement_csv): ?>
            <div style="padding:10px;">
                <a href="<?php echo str_replace("/public","",url($result->seat_arrangement_csv)); ?>" /><?php echo basename($result->seat_arrangement_csv); ?></a>
            </div>
            <?php endif; ?>
            <?php echo Form::label('Route Map Attachments', 'Route Map Attachments (Use CTRL + to multi-select attachments)'); ?>
            <?php echo Form::file('route_map_attachment[]',array('multiple'=>"multiple")); ?>
            <ul class="list-group" style="margin-top:10px;">
            <?php
            $attachments =@explode(",",$result->route_map_attachment);
            foreach($attachments as $attachment):
            ?>
            <li class="list-group-item" style="border:1px solid lightblue !important"><a download='<?php echo basename($attachment); ?>' href="<?php echo str_replace("/public","",url($attachment)); ?>" ><?php echo basename($attachment); ?></a></li>
            <?php endforeach; ?>
                </ul>
            <?php echo Form::hidden('route_map_id',$route_map_id); ?>
            <?php echo Form::token(); ?>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
