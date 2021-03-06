<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Forms'))->render();
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
  <h1>Forms  <a  href='<?php echo url("system-admin/form/add"); ?>' class="btn btn-primary" style="float:right">Add New</a></h1>
  <table class='table table-striped'>
  <tr><th>ID</th><th>Form Name</th><th width='40%'>Form Description</th><th>Campus</th><th>Form Attachment</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $form_attachment=str_replace("/public","",Request::root().$key->form_attachment);
    $school=schoolName($key->school_id);
    $edit="<a href='$root/system-admin/form/edit/{$key->form_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/forms/forms/form_id/{$key->form_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $view="<a href='$form_attachment' download class='label label-success'>View</a>";
  echo "<tr><td>{$key->form_id}</td><td><code>{$key->form_name}</code></td><td>{$key->form_description}</td><td>$school</td><td>$view</td><td>$edit  $delete</td></tr>";
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
