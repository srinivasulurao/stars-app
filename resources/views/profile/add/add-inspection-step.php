<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Trip Inspection Steps'))->render();
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
        <h1>Add Trip Inspection Step Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-inspection-step-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Step Name', 'Step Name'); ?>
            <?php echo Form::text('step','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Inpection Type', 'Inspection Type'); ?>
            <?php echo Form::select('inspection_type',getInspectionTypeDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Step Image', 'Step Image'); ?>
            <?php echo Form::file('step_image',array('required','required')); ?><br>
           
            <?php echo Form::token(); ?>
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