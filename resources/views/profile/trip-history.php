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

  //debug($results);
  //exit;
  ?>
  <h1>Trip History <a  href='<?php echo url("system-admin/pre-trip-survey"); ?>' class="btn btn-primary" style="float:right">Add New</a></h1>
  <table class='table table-striped'>
  <tr><th>ID</th><th>Route</th><th>Driver</th><th>Route Type</th><th>Trip Time</th><th>Pre Trip Inspection</th><th>Post Trip Inspection</th><th>Trip Status</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    
    $route=routeName($key->route_id);
    $trip_time=date("Y/m/d H:i A",strtotime($key->trip_time));
    $driver=DriverName($key->driver_id);
    $route_type=routeType($key->route_type);
    $edit="<a href='$root/system-admin/trip-history/edit/{$key->trip_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
     $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/trip-history/trip_history/trip_id/{$key->trip_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $view_pre="<a href='$root/system-admin/view-pre-trip-inspection/{$key->pre_inspection_id}' class='label label-primary' target='_blank'>{$key->pre_trip}</a>";
    $view_post="<a href='$root/system-admin/view-post-trip-inspection/{$key->post_inspection_id}' class='label label-primary' target='_blank'>{$key->post_trip}</a>";
  echo "<tr><td>{$key->trip_id}</td><td><code>{$route}</code></td><td>$driver</td><td>$route_type</td><td>{$trip_time}</td><td>$view_pre</td><td>$view_post</td><td>{$key->trip_status}</td><td>$edit  $delete</td></tr>";
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
