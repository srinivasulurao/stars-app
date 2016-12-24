<?php
echo View::make('billing.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("billing.sidebar",array('active_link'=>'Invoices'))->render();
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
  <h1>Invoices  <a  href='<?php echo url("billing-admin/invoice/add"); ?>' class="btn btn-primary" style="float:right">Add Invoice</a> 
  <a  href='javascript:void(0)' class="btn btn-primary" style="float:right;margin-right:10px;" data-toggle='modal' data-target='#uploadEntity'>Upload CSV File</a>
  <a  href='<?php echo str_replace("/public/","/",url('uploads/mass-upload/driver_upload.csv')); ?>' download class="btn btn-primary" style="float:right;margin-right:10px;" >Sample CSV File</a>
  </h1>
  <table class='table table-striped'>
  <tr><th style='display:none'>Picture</th><th>First Name</th><th>Last Name</th><th>Campus</th><th>District</th><th> Description</th><th>Username</th><th style='display:none'>Email</th><th>Phone</th></th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $pic_url=str_replace("/public","",Request::root().$key->profile_pic);
    $pic="<img src='$pic_url' class='thumbnail' style='height:70px;width:70px;border-radius:50%'>";
    $school=schoolName($key->school_id);
    $district=districtName($key->district_id);
    $edit="<a href='$root/system-admin/driver/edit/{$key->driver_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/drivers/drivers/driver_id/{$key->driver_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $driver_description=($key->driver_description)?driverDescription($key->driver_description):"";
  echo "<tr><td style='display:none'>$pic</td><td>{$key->first_name}</td><td> {$key->last_name}</td><td>{$school}</td><td>{$district}</td><td>$driver_description</td><td>{$key->username}</td><td style='display:none'>{$key->email}</td><td>{$key->phone}</td><td>$edit  $delete</td></tr>";
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
        <h4 class="modal-title">Upload  Drivers</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='driver-mass-upload' enctype="multipart/form-data">
        <p>Add Driver using CSV files.</p>
        <input type='file' name='drivers_csv' id='drivers_csv' required="required" class='form-control'>
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
echo view('billing.footer');
?>

