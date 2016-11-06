<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Incidents'))->render();
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
  <h1>Incidents  <a href="<?php echo url("system-admin/incident/add"); ?>" class="btn btn-primary" style="float:right">Add New</a></h1>

  <table class='table table-striped'>
  <tr><th>Incident Id</th><th>About Incident</th><th>Type</th><th>Description</th><th>Attachment</th><th>Name</th><th>Email</th><th>Phone<th>Location</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $attachment_url=str_replace("/public","",Request::root().$key->incident_attachment);
    $attachment="<a style='text-decoration:none;cursor:pointer !important' target='_blank' download='IncidentAttachment' href='$attachment_url'><label class='label label-success' style='cursor:pointer'>View</label></a>";
    $edit="<a href='$root/system-admin/incident/edit/{$key->incident_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/incidents/incidents/incident_id/{$key->incident_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
  echo "<tr><td>{$key->incident_id}</td><td><code>{$key->about_incident}</code></td><td>{$key->incident_type}</td><td>{$key->incident_description}</td><td>$attachment</td><td>{$key->name}</td><td>{$key->email}</td><td>{$key->phone}</td><td>{$key->incident_location}</td><td>$edit  $delete</td></tr>";
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
