<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
    <div class='col-md-2 sidebar'>
        <?php
        echo View::make("profile.sidebar",array('active_link'=>'Schools'))->render();
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
        <h1>Edit School Details</h1>
        <form method="post" action="<?php echo site_url("/system-admin/update-school-details"); ?>"  style="width:50%" enctype="multipart/form-data">
            <?php echo Form::label('School Name', 'School Name'); ?>
            <?php echo Form::text('school_name', $result->school_name,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School Address', 'School Address'); ?>
            <?php echo Form::text('school_address', $result->school_address,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('District', 'District'); ?>
            <?php echo Form::select('district_id',getDistrictsDropDown(), $result->district_id,array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School Description', 'School Description'); ?>
            <?php echo Form::textarea('school_description', $result->school_description,array('class'=>"form-control","required"=>"required","rows"=>5)); ?>
            <?php echo Form::label('School Picture', 'School Picture'); ?>
            <?php echo Form::file('school_pic'); ?>
            <br><img class='thumbnail' style="height:70px" src="<?php echo str_replace("/public","",url($result->school_pic)); ?>" />
            <?php echo Form::hidden('school_id',$school_id); ?>
            <?php echo Form::token(); ?>
            <?php echo Form::submit('Submit',array('class'=>"btn btn-success","required"=>"required")); ?>

        </form>

    </div>


</div> <!-- Container ends -->

<?php
echo view('profile.footer');
?>
