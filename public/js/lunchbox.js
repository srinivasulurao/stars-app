$(document).ready(function(){
//All Codes to be embed here.
$('.changePassword').click(function(){
    $('.changePasswordDiv').slideToggle();
    $("#confirm-password,#password").val('');
});

$('.delete_atrib').hover(function(){
var href=$(this).attr('data-link');
$('#deleteEntryButton').attr('href',href);
});

});




