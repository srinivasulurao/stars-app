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
        <h1>Edit Vehicle Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/update-vehicle-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            
            
            <?php echo Form::label('Vehicle Number', 'Vehicle Number'); ?>
            <?php echo Form::text('vehicle_no', $result->vehicle_no,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Vehicle Type', 'Vehicle Type'); ?>
            <?php echo Form::select('vehicle_type',vehicleTypeDropDown(),$result->vehicle_type,array('class'=>"form-control")); ?>
            <?php echo Form::label('Occupancy', 'Occupancy'); ?>
            <?php echo Form::text('occupancy', $result->occupancy,array('class'=>"form-control","rows"=>5)); ?>
            <?php echo Form::label('Mileage', 'Mileage'); ?>
            <?php echo Form::text('mileage', $result->mileage,array('class'=>"form-control","rows"=>5)); ?>
            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::select('district_id',getDistrictsDropDown(),$result->district_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Year Model', 'Year Model'); ?>
            <?php echo Form::text('year_model',$result->year_model,array('placeholder'=>"YYYY (Ex: 1991)","maxlength"=>"4",'class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::hidden('vehicle_id',$vehicle_id); ?>
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