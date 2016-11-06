<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Route Types'))->render();
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
  <h1>Route Types <a data-toggle='modal' data-target='#addEntity'  href='javascript:void()' class="btn btn-primary" style="float:right">Add New</a></h1>
  <table class='table table-striped'>
  <tr><th>ID</th><th>Route Type</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $js=json_encode(array('id'=>$key->id,"type"=>$key->type));
    $edit="<a onclick='editVal($js)' data-toggle='modal' data-target='#editEntity' href='javascript:void(0)' class='btn btn-info'><i class='glyphicon glyphicon-edit editVal'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/route-types/route_types/id/{$key->id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
      echo "<tr><td>{$key->id}</td><td><code>{$key->type}</code></td><td>$edit  $delete</td></tr>";
  endforeach;
  ?>
</table>

</div>


</div> <!-- Container ends -->

<div class="modal fade" id="addEntity" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Route Type</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='<?php echo url('system-admin/addRouteType'); ?>' enctype="multipart/form-data">
            <?php echo Form::label('Route Type', 'Route Type'); ?>
            <?php echo Form::text('type', '',array('class'=>"form-control","required"=>"required")); ?>
      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <input type='hidden' name='del_food_category_id' id='del_food_category_id'>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-info">Submit</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="editEntity" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Route Type</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='<?php echo url('system-admin/updateRouteType'); ?>' enctype="multipart/form-data">
            <?php echo Form::label('Type', 'Type'); ?>
            <?php echo Form::text('type', '',array('id'=>'type','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::hidden('id', '',array('id'=>'id','class'=>"form-control","required"=>"required")); ?>
      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <input type='hidden' name='del_food_category_id' id='del_food_category_id'>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-info">Submit</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

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

<script type="text/javascript">

  function editVal(jsd){
    $('#id').val(jsd.id);
    $('#type').val(jsd.type);
  }

</script>
