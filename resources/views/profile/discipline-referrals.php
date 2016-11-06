<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Discipline Referrals'))->render();
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
  <h1>Discipline Referrals  <a  href='<?php echo url('system-admin/discipline-referral/add'); ?>' class="btn btn-primary" style="float:right">Add New</a></h1>

  <table class='table table-striped'>
  <tr><th>ID</th><th>Student Name</th><th>Driver</th><th>School</th><th>Vehicle</th><th>Offence</th><th>Offence Time</th><th>Offence Location</th><th width="25%">Comments</th><th width="12%">Action</th></tr>

  <?php
  $root=Request::root();
  foreach($results as $key):
    $edit="<a href='$root/system-admin/discipline-referral/edit/{$key->complaint_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/discipline-referrals/discipline_referrals/complaint_id/{$key->complaint_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $offence_time=date("Y-m-d H:i A",strtotime($key->offence_time));
    $driver=driverName($key->driver_id);
    $school=schoolName($key->school_id);
    $vehicle=vehicleName($key->vehicle_id);
  echo "<tr><td>{$key->complaint_id}.</td><td>{$key->student_name}</td><td>{$driver}</td><td>$vehicle</td><td>{$school}</td><td>{$key->offence}</td><td>$offence_time</td><td>{$key->offence_location}</td><td>{$key->comments}</td><td>$edit  $delete</td></tr>";
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
