$(document).ready(function(){
//All Codes to be embed here.
$('.changePassword').click(function(){
    $('.changePasswordDiv').slideToggle();
    $("#confirm-password,#password").val('');
});

});

function generateCanteenCode(){
  rand=Math.random();
  rand=rand*100000000000000000;
  $('#canteen_secret_code').val("#"+rand);
}

function editFoodItemCategory(data){
  //json=JSON.parse(data);
  jsonData=JSON.parse(JSON.stringify(data));
  $('#category_name').val(jsonData.category_name);
  $('#category_description').val(jsonData.category_description);
  $('#food_category_id').val(jsonData.food_category_id);
  $('#editCategory').modal('show');

}

function deleteFoodItemCategory(del_cat_id){
  $('#del_food_category_id').val(del_cat_id);
  $('#deleteCategory').modal('show');
}
