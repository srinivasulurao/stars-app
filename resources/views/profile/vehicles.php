<?php
echo view('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo view('profile.sidebar',array('active_link'=>'Vehicles'));
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
    <h1>Authorized Vehicles<a  href='<?php echo url('system-admin/vehicle/add'); ?>' class="btn btn-primary" style="float:right">Add New</a>
<a  href='javascript:void(0)' class="btn btn-primary" style="float:right;margin-right:10px;" data-toggle='modal' data-target='#uploadEntity'>Upload CSV File</a>
  <a  href='<?php echo str_replace("/public/","/",url('uploads/mass-upload/vehicle_upload.csv')); ?>' download class="btn btn-primary" style="float:right;margin-right:10px;" >Sample CSV File</a>
    </h1>

    <table class='table table-striped'>
        <tr><th style="display: none;">Vehicle Picture</th><th style='display: none;'>Vehicle Name</th><th>Vehicle No.</th><th>Vehicle Type</th><th>Vehicle Mileage</th><th>Occupancy</th><th>Year Model</th><th style='display: none;'>School</th><th style='display: none;'>Authorized Drivers</th><th style='display: none;'>Seating CSV</th><th>Action</th></tr>
        <?php
        $root=Request::root();
        foreach($results as $key):
            $pic_url=str_replace("/public","",Request::root().$key->vehicle_image);
            $seat_arrangement_csv=str_replace("/public","",Request::root().$key->seat_arrangement_csv);
            $pic="<img src='$pic_url' class='thumbnail' style='height:70px;width:70px;border-radius: 50%'>";
            $edit="<a href='$root/system-admin/vehicle/edit/{$key->vehicle_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
            $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/vehicles/vehicles/vehicle_id/{$key->vehicle_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
            $school=schoolName($key->school_id);
            $authorized_explode=explode(",",$key->authorized_drivers);
            $authorized_explode=array_map('driverName',$authorized_explode);
            $authorized_drivers=@implode(", ", $authorized_explode);
            $vehicle_type=vehicleType($key->vehicle_type);
            $view="<a href='$seat_arrangement_csv' class='label label-success' download>View</a>";
            echo "<tr><td style='display: none;'>$pic</td><td style='display: none;'><code>{$key->vehicle_name}</code></td><td><code>{$key->vehicle_no}</code></td><td>$vehicle_type</td><td>{$key->mileage}</td><td>{$key->occupancy}</td><td>{$key->year_model}</td><td style='display: none;'>$school</td><td style='display: none;'>$authorized_drivers</td><td style='display: none;'>$view</td><td>$edit  $delete</td></tr>";
        endforeach;
        ?>
    </table>
</div>


</div> <!-- Container ends -->

<div class="modal fade" id="deleteEntity" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Entry</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='delete-food-item-category' enctype="multipart/form-data">
        <p> Are you sure, you want to delete this entry? This action can't be undone.</p>

      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <input type='hidden' name='del_food_category_id' id='del_food_category_id'>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a href='javascript:void(0)' id='deleteEntryButton' class="btn btn-danger">Delete</a>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="uploadEntity" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Upload  Vehicles</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='vehicle-mass-upload' enctype="multipart/form-data">
        <p>Add Vehicles using CSV files.</p>
        <input type='file' name='vehicle_csv' id='vehicle_csv' required="required" class='form-control'>
      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-info">Upload</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 
<?php
echo view('profile.footer');
?>
