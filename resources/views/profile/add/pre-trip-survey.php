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
        <h1>Answer Pre Trip Inspection</h1>
        <form method="post" action="<?php echo site_url("/system-admin/add-pre-trip-survey"); ?>"  style="width:50%" enctype="multipart/form-data">
            <table class='table table-striped'>
            <?php
            //debug($trip_steps);
            foreach($trip_steps as $trip_step):
            if($trip_step->inspection_type =="pre"):
            echo "<tr><td width='80%'>";    
            echo Form::label($trip_step->step, $trip_step->step);
            echo "</td><td>";
            echo " &nbsp <input name='{$trip_step->inspection_step_id}' type='radio' value='yes' required='required'> Yes <input type='radio' name='{$trip_step->inspection_step_id}' value='no' required='required'> No";
            echo "</td></tr>";
            endif;
            endforeach;    
            ?>
            </table>
            <?php echo Form::label('Comments', 'Comments'); ?>
            <?php echo Form::textarea('comments', '',array('id'=>'comments','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Odometer Reading', 'Odometer Reading'); ?>
            <?php echo Form::select('odometer_reading',getOdometerDropDown(), '',array('id'=>'odometer_reading','class'=>"form-control","required"=>"required")); ?>

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