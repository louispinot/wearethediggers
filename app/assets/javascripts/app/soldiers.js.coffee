jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more Soldiers...")
        $.getScript(url)
    $(window).scroll()

`
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


});`



