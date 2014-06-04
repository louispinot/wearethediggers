 // # Place all the behaviors and hooks related to the matching controller here.
 // # All this logic will automatically be available in application.js.
 // # You can use CoffeeScript in this file: http://coffeescript.org/


$(function(){

  var $container = $('#pictures-grid');

  $container.imagesLoaded(function(){
    // console.debug("coucou");
    $container.masonry({
      itemSelector: '.picture-box',
      isAnimated: !Modernizr.csstransitions,
      isFitWidth: true,
      gutterWidth: 10
    });
  });

  $container.infinitescroll({
    navSelector  : '.pagination',    // selector for the paged navigation
    nextSelector : '.next_page',  // selector for the NEXT link (to page 2)
    itemSelector : '.picture-box',     // selector for all items you'll retrieve
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
