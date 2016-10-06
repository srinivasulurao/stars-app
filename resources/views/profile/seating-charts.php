<?php
echo view('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo view('profile.sidebar',array('active_link'=>'Seating Chart'));
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
    $sample_csv_file=str_replace("/public","",Request::root()."/uploads/sample/Sample-Seating-Arrangement.csv");
    ?>
    <h1>Seating Arrangements <a download="Sample-Seating-Arrangement.csv" href='<?php echo $sample_csv_file; ?>' class="btn btn-primary" style="float:right">Download Sample CSV File</a></h1>

    <table class='table table-striped'>
        <tr><th>Vehicle Picture</th><th>Vehicle Name</th><th>Vehicle No.</th><th>Action</th></tr>
        <?php
        $root=Request::root();
        foreach($results as $key):
            $pic_url=str_replace("/public","",Request::root().$key->vehicle_image);
            $pic="<img src='$pic_url' class='thumbnail' style='height:70px;width:70px;border-radius: 50%'>";
            $view="<a href='$root/system-admin/seating-chart/view/{$key->vehicle_id}' class='btn btn-info'>View</a>";

            echo "<tr><td>$pic</td><td>{$key->vehicle_name}</td><td>{$key->vehicle_no}</td><td>$view</td></tr>";
        endforeach;
        ?>
    </table>
</div>


</div> <!-- Container ends -->
<?php
echo view('profile.footer');
?>
