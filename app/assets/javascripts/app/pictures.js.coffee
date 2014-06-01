 # Place all the behaviors and hooks related to the matching controller here.
 # All this logic will automatically be available in application.js.
 # You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("loading more pictures...")
        $.getScript(url, ->
           new AnimOnScroll document.getElementById('#grid'),
               minDuration : 0.4,
               maxDuration : 0.7,
               viewportFactor : 0.2
              )
    $(window).scroll()