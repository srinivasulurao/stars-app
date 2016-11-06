<?php
echo view('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Dashboard'))->render();
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
    ?>
    <h1><i class="glyphicon glyphicon-dashboard"></i> Dashboard</h1>

    <div class="col-md-3 panel panel-primary"><h4 class="panel-heading">Total Schools</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_schools; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-primary"><h4 class="panel-heading">Total Drivers</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_drivers; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-primary"><h4 class="panel-heading">Total Vehicles</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_vehicles; ?></label></div>
    </div>
<hr style='clear:both'>
    <div class="col-md-3 panel panel-danger"><h4 class="panel-heading">Total Incidents</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_incidents; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-danger"><h4 class="panel-heading">Total Discipline Referrals</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_dr; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-danger"><h4 class="panel-heading">Total Maintenance Issues</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_mi; ?></label></div>
    </div>
<hr style='clear:both'> 
    <div class="col-md-3 panel panel-warning"><h4 class="panel-heading">Total Trips</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_incidents; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-warning"><h4 class="panel-heading">Total Trips Completed</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_trips_complete; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-warning"><h4 class="panel-heading">Total Trips Incompleted</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_trips_incomplete; ?></label></div>
    </div>

<hr style='clear:both'> 

    <div class="col-md-3 panel panel-info"><h4 class="panel-heading">Total Routes</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_routes; ?></label></div>
    </div>
    <div class="col-md-3 panel panel-info"><h4 class="panel-heading">Total Forms</h4>
    <div class='panel-body'><label class="badge"><?php echo $total_forms; ?></label></div>
    </div>
    
</div>


</div> <!-- Container ends -->
<?php
echo view('profile.footer');
?>
