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
  <tr><th>Student Name</th><th>Offence</th><th>Offence Time</th><th>Offence Location</th><th width="30%">Comments</th><th width="15%">Action</th></tr>

  <?php
  $root=Request::root();
  foreach($results as $key):
    $edit="<a href='$root/system-admin/discipline-referral/edit/{$key->complaint_id}' class='btn btn-info'>Edit</a>";
    $delete="<a href='$root/system-admin/discipline-referral/delete/{$key->complaint_id}' class='btn btn-danger'>Delete</a>";
    $offence_time=date("Y-m-d H:i A",strtotime($key->offence_time));
  echo "<tr><td>{$key->student_name}</td><td>{$key->offence}</td><td>$offence_time</td><td>{$key->offence_location}</td><td>{$key->comments}</td><td>$edit  $delete</td></tr>";
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
