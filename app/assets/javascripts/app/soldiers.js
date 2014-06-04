$(document).ready(function(){
   // Deals with the medium-editor.js for editing soldier bio
  $('.submit-bio').on("click", function(){
    var bioHTML = $('.editable').html();
    $('#bio').val(bioHTML);
  });

  // bind search form submit to pressiong enter on index view
  // $('.search-box').keypress(function (e) {
  //  if (e.which == 13) {
  //    $('.soldier-search-form').submit();
  //  }
  //});


});

