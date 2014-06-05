// BIOGRAPHY EDIT WITH MEDIUM EDITOR
$(document).ready(function(){
   // Deals with the medium-editor.js for editing soldier bio
  var editor = new MediumEditor('.editable');

  $('.submit-bio-edit').on("click", function(e){
    e.preventDefault;
    var bioHTML = $('.editable').html();
    $('#bio').val(bioHTML);
  });

  // bind search form submit to pressiong enter on index view
  // $('.search-box').keypress(function (e) {
  //  if (e.which == 13) {
  //    $('.soldier-search-form').submit();
  //  }
  //});


// INFINITE SCROLLING    #######################################################


  var $container = $('#soldiers-grid');

  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.soldier-card',
      isAnimated: !Modernizr.csstransitions,
      isFitWidth: true,
      gutterWidth: 5
    });
  });

  $container.infinitescroll({
    navSelector  : '.pagination',    // selector for the paged navigation
    nextSelector : '.next_page',  // selector for the NEXT link (to page 2)
    itemSelector : '.soldier-card',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: ""
      }
    },
    // trigger Masonry as a callback
    function( newElements ) {
      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout
      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true );
      });
    }
  );
});
