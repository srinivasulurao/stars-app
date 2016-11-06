<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Vehicles'))->render();
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
        <h1>Add Vehicle Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-vehicle-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Vehicle Name', 'Vehicle Name'); ?>
            <?php echo Form::text('vehicle_name','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Vehicle Number', 'Vehicle Number'); ?>
            <?php echo Form::text('vehicle_no', '',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Authorized Drivers', 'Authorized Drivers'); ?>
            <?php echo Form::select('authorized_drivers[]',getDriversDropDown(),'', array('multiple'=>'multiple','style'=>'height:200px','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Occupancy', 'Occupancy'); ?>
            <?php echo Form::text('occupancy','',array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('Mileage', 'Mileage'); ?>
            <?php echo Form::text('mileage','',array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('Manufacture Date', 'Manufacture Date'); ?>
            <?php echo Form::text('created_date','',array('id'=>"created_date",'class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Vehicle Picture', 'Vehicle Picture'); ?>
            <?php echo Form::file('vehicle_image',array('required'=>"required")); ?>
            <?php echo Form::label('Seat Arrangement CSV', 'Seat Arrangement CSV'); ?>
            <?php echo Form::file('seat_arrangement_csv'); ?>

            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>

<script>
    $('#created_date').appendDtpicker({
        "autodateOnStart": false
    });
</script>