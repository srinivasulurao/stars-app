<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Trip Inspection Steps'))->render();
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
  ?>
  <h1>Trip Inspection Steps  <a class="btn btn-primary" href="<?php echo url("/system-admin/inspection-step/add"); ?>"style="float:right">Add New</a></h1>

  <table class='table table-striped'>
  <tr><th>ID</th><th>Inspection Step </th><th>Inspection Type</th><th width="13%">Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $edit="<a href='$root/system-admin/inspection-step/edit/{$key->inspection_step_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/inspection-steps/trip_inspection_steps/inspection_step_id/{$key->inspection_step_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
  echo "<tr><td>{$key->inspection_step_id}.</td><td><code>{$key->step}</code></td><td style='text-transform:capitalize'>{$key->inspection_type} Trip Inspection</td><td>$edit  $delete</td></tr>";
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
