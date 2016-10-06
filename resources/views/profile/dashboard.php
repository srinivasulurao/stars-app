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

</div>


</div> <!-- Container ends -->
<?php
echo view('profile.footer');
?>
