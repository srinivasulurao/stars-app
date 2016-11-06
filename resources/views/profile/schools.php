<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>
<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Schools'))->render();
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
  <h1>Schools  <a class="btn btn-primary" href="<?php echo url("/system-admin/school/add"); ?>"style="float:right">Add New</a></h1>

  <table class='table table-striped'>
  <tr><th>ID</th><th>Picture</th><th>Name</th><th>District</th><th> Address</th><th width='30%'>Description</th></th><th width="13%">Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $pic_url=str_replace("/public","",Request::root().$key->school_pic);
    $pic="<img src='$pic_url' class='thumbnail' style='height:70px;width:70px;border-radius:50%'>";
    $edit="<a href='$root/system-admin/school/edit/{$key->school_id}' class='btn btn-info'><i class='glyphicon glyphicon-edit'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/schools/schools/school_id/{$key->school_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
    $district=districtName($key->district_id);
  echo "<tr><td>{$key->school_id}.</td><td>$pic</td><td><code>{$key->school_name}</code></td><td>$district</td><td>{$key->school_address}</td><td>{$key->school_description}</td><td>$edit  $delete</td></tr>";
  endforeach;
  ?>
</table>

</div>


</div> <!-- Container ends -->

<div class="modal fade" id="addNewCategory" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Food Item Category</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='add-new-food-item-category' enctype="multipart/form-data">
        <label>Category name</label>
        <input type='text' name='category_name' required="required" class='form-control'>
        <label>Description</label>
        <textarea name='category_description'  required="required" class='form-control'></textarea>
        <label>Category Image</label>
        <input type='file' name='category_image' required="required" class='form-control'>
      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" name='add-new-cat-sub' class="btn btn-primary">Save changes</button>
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
