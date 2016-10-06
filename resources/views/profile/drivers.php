<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Drivers'))->render();
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
  <h1>Drivers  <a  href='<?php echo url("system-admin/driver/add"); ?>' class="btn btn-primary" style="float:right">Add New</a></h1>
  <table class='table table-striped'>
  <tr><th>Picture</th><th>Driver Name</th><th> Description</th><th>Total Experience</th><th>Email</th><th>Phone</th></th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    $pic_url=str_replace("/public","",Request::root().$key->profile_pic);
    $pic="<img src='$pic_url' class='thumbnail' style='height:70px;width:70px;border-radius:50%'>";
    $edit="<a href='$root/system-admin/driver/edit/{$key->driver_id}' class='btn btn-info'>Edit</a>";
    $delete="<a href='$root/sytem-admin/driver/delete/{$key->driver_id}' class='btn btn-danger'>Delete</a>";
  echo "<tr><td>$pic</td><td><code>{$key->first_name} {$key->last_name}</code></td><td>{$key->about_driver}</td><td>{$key->total_exp}Year(s)</td><td>{$key->email}</td><td>{$key->phone}</td><td>$edit  $delete</td></tr>";
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


<div class="modal fade" id="editCategory" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Food Item Category</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='edit-food-item-category' enctype="multipart/form-data">
        <label>Category name</label>
        <input type='text' name='category_name' id='category_name'  required="required" class='form-control'>
        <label>Description</label>
        <textarea name='category_description' id='category_description' required="required" class='form-control'></textarea>
        <label>Category Image</label>
        <input type='file' name='category_image'  id='category_image'  class='form-control'>
        <input type='hidden' name='food_category_id' id='food_category_id'>
      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" name='edit-cat-sub' class="btn btn-primary">Save Changes</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="deleteCategory" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Food Item Category</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='delete-food-item-category' enctype="multipart/form-data">
        <p> Are you sure, you want to delete this food item category ?</p>

      </div>
      <div class="modal-footer">
        <input type='hidden' name='_token' value="<?php echo csrf_token(); ?>">
        <input type='hidden' name='del_food_category_id' id='del_food_category_id'>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" name='delete-cat-sub' class="btn btn-danger">Delete</button>
      </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<?php
echo view('profile.footer');
?>
