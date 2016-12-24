<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Forms'))->render();
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
        <h1>Edit Form Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/update-form-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('Form Name', 'Form Name'); ?>
            <?php echo Form::text('form_name', $result->form_name,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Form Description', 'Form Description'); ?>
            <?php echo Form::textarea('form_description', $result->form_description,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Campus', 'Campus'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),$result->school_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Form Attachment', 'Form Attachment'); ?>
            <?php echo Form::file('form_attachment'); ?>
            <div style="padding:10px;">
                <a target="_blank" href="<?php echo str_replace("/public","",url($result->form_attachment)); ?>" /><?php echo basename($result->form_attachment); ?></a>
            </div>
            <?php echo Form::hidden('form_id',$form_id); ?>
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