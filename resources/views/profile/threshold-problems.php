<?php
echo View::make('profile.header',array('title'=>$title));
?>

<div class='container profile-container'>

<div class='col-md-2 sidebar'>
<?php
echo View::make("profile.sidebar",array('active_link'=>'Threshold Problems'))->render();
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
  <h1>Threshold Problems <a data-toggle='modal' data-target='#addEntity'  href='javascript:void()' class="btn btn-primary" style="float:right">Add New</a></h1>
  <table class='table table-striped'>
  <tr><th>ID</th><th>School</th><th>Threshold</th><th>Threshold Value</th><th>Action</th></tr>
  <?php
  $root=Request::root();
  foreach($results as $key):
    
    $school=schoolName($key->school_id);
    $js=json_encode(array('id'=>$key->threshold_id,"threshold"=>$key->threshold,'threshold_value'=>$key->threshold_value,'school_id'=>$key->school_id));
    $edit="<a onclick='editVal($js)' data-toggle='modal' data-target='#editEntity' href='javascript:void(0)' class='btn btn-info'><i class='glyphicon glyphicon-edit editVal'></i></a>";
    $delete="<a data-toggle='modal' data-target='#deleteEntity'  href='javascript:void()' data-link='$root/system-admin/delete/threshold-problems/school_vehicle_threshold/threshold_id/{$key->threshold_id}' class='btn btn-danger delete_atrib'><i class='glyphicon glyphicon-trash'></i></a>";
      echo "<tr><td>{$key->threshold_id}</td><td>$school</td><td><code>{$key->threshold}</code></td><td>{$key->threshold_value}</td><td>$edit  $delete</td></tr>";
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
        <h4 class="modal-title">Add Threshold Problem</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='<?php echo url('system-admin/addThresholdProblem'); ?>' enctype="multipart/form-data">
            <?php echo Form::label('Threshold', 'Threshold'); ?>
            <?php echo Form::text('threshold', '',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Threshold Value', 'Threshold Value'); ?>
            <?php echo Form::textarea('threshold_value', '',array('class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),'',array('class'=>"form-control","required"=>"required")); ?>
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
        <h4 class="modal-title">Edit Threshold Problem</h4>
      </div>
      <div class="modal-body">
        <form method="post" action='<?php echo url('system-admin/updateThresholdProblem'); ?>' enctype="multipart/form-data">
            <?php echo Form::label('Threshold', 'Threshold'); ?>
            <?php echo Form::text('threshold', '',array('id'=>'threshold','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('Threshold Value', 'Threshold Value'); ?>
            <?php echo Form::textarea('threshold_value', '',array('id'=>'threshold_value','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::label('School', 'School'); ?>
            <?php echo Form::select('school_id',getSchoolsDropDown(),'',array('id'=>'school_id','class'=>"form-control","required"=>"required")); ?>
            <?php echo Form::hidden('threshold_id', '',array('id'=>'threshold_id','class'=>"form-control","required"=>"required")); ?>
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
    $('#threshold_id').val(jsd.id);
    $('#threshold').val(jsd.threshold);
    $('#threshold_value').val(jsd.threshold_value);
    $('#school_id').val(jsd.school_id);
  }

</script>
