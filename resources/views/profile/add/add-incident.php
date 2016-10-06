<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Incidents'))->render();
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
        <h1>Add Incident Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-incident-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('About Incident', 'About Incident'); ?>
            <?php echo Form::text('about_incident','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Incident Type','Incident Type'); ?>
            <?php echo Form::text('incident_type','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Description', 'Description'); ?>
            <?php echo Form::textarea('incident_description','',array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('Incident Location', 'Incident Location'); ?>
            <?php echo Form::textarea('incident_location','',array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('Reporter Name', 'Reporter Name'); ?>
            <?php echo Form::text('name','', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Reporter Email', 'Reporter Email'); ?>
            <?php echo Form::email('email','',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Reporter Phone', 'Reporter Phone'); ?>
            <?php echo Form::text('phone','', array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Incident Attachment', 'Incident Attachment'); ?>
            <?php echo Form::file('incident_attachment'); ?>

            <?php echo Form::token(); ?><br>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
