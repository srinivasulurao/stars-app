<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Maintenance'))->render();
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
  <h1>Maintenance History  <a class="btn btn-primary" href="<?php echo url("/system-admin/maintenance-history/add"); ?>"style="float:right">Add New</a></h1>

  <table class='table table-striped'>
  <tr><th>ID</th><th>Problem </th><th>Problem Location</th><th>Vehicle</th><th>Driver</th><th> School</th><th>Occurance Time</th><th width="13%">Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $vehicle=vehicleName($key->vehicle_id);
    $driver=DriverName($key->driver_id);
    $school=SchoolName($key->school_id);
    $problem=thresholdProblem($key->problem);
    $edit="<a href='$root/system-admin/maintenance-history/edit/{$key->issue_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/maintenance-history/vehicle_maintenance_history/issue_id/{$key->issue_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $problem_occured_time=date("Y/m/d H:i A",strtotime($key->problem_occured_time));
  echo "<tr><td>{$key->issue_id}</td><td>$problem</td><td>{$key->problem_location}</td><td>$vehicle</td><td>$driver</td><td>$school</td><td>$problem_occured_time</td><td>$edit  $delete</td></tr>";
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


<?php
echo view('profile.footer');
?>
