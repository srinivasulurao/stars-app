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
        <h1>View Pre Trip Inspection</h1>
        
            <table class='table table-striped'>
            <?php
            $inspection_data=unserialize(base64_decode($result->inspection_data));
           // debug($inspection_data);
            foreach($inspection_data as $key=>$value):
                $inspection_step=inspectionStepName($key);
            echo "<tr><td style='width:80%'>$inspection_step</td><td>$value</td>";    
            endforeach;    
            $odometer_reading=odometerReading($result->odometer_reading);  
            echo "<tr><td style='width:80%'>Comments</td><td>{$result->comments}</td>";    
            echo "<tr><td style='width:80%'>Odometer Reading</td><td>$odometer_reading</td>";
            ?>
            </table>
            

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