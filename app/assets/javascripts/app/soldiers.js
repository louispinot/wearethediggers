$(document).ready(function(){
 // Deals with the medium-editor.js for editing soldier bio
  $('.submit-bio').on("click", function(){
    var bioHTML = $('.editable').html();
    $('#bio').val(bioHTML);
  });

// bind search form submit to pressiong enter on index view
  $('.search-box').keypress(function (e) {
  if (e.which == 13) {
    $(self).parent.submit();
  }
});




  var $container = $('#soldiers');

  $container.imagesLoaded(function(){
    $container.masonry({
      itemSelector: '.soldier-card',
      isFitWidth: true,
      gutterWidth: 5
    });
  });

  $container.infinitescroll({
    navSelector  : '.pagination',    // selector for the paged navigation
    nextSelector : '.next_page',  // selector for the NEXT link (to page 2)
    itemSelector : '.soldier-card',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: "Congratulations you've seen all the collection" ,
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