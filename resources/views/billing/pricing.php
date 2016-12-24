<?php
echo View::make('billing.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("billing.sidebar",array('active_link'=>'Pricing'))->render();
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
  <h1>Pricing for Districts
  <a  href='javascript:void(0)' class="btn btn-primary" style="float:right;margin-right:10px;" data-toggle='modal' data-target='#uploadEntity'>Add District</a>
    </h1>
  <table class='table table-striped'>
  <tr><th>District Id</th><th style="width:60%">District Name</th><th>State</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $set_pricing="<a href='$root/billing-admin/pricing/edit/{$key->district_id}'  class='btn btn-info'><i class='glyphicon glyphicon-euro'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/billing-admin/delete/pricing/districts/district_id/{$key->district_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    echo "<tr><td>{$key->district_id}</td><td>{$key->district_name}</td><td>{$key->state}</td><td>$set_pricing $delete</td></tr>";
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
        <h4 class="modal-title">Add New District</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='add-district' enctype="multipart/form-data">
          <label>District Name</label>
        <input type='text' name='district_name'  required="required" class='form-control'>

          <label>State</label>
          <input type='text' name='state'  required="required" class='form-control'>

      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-info">Save</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<?php
echo view('billing.footer');
?>

