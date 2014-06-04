// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  $( "#desc-box" ).fadeIn( "slow", function() {
      // Animation complete
    });

  $('#tags').multiSelect();



  $.each(tag_list, function(index, value){
    $('#tags option [value=' + value + ']').attr('selected', 'selected')
  });


  $('#select-all').click(function(){
    $('#tags').multiSelect('select_all');
    return false;
  });
  $('#deselect-all').click(function(){
    $('#tags').multiSelect('deselect_all');
    return false;
  });
});