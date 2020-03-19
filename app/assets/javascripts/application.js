//= require jquery
//= require rails-ujs
//= require bootstrap
//= require turbolinks
//= require activestorage
//= require_tree .

function invoke(url, method, data, success, error){
  $.ajax({
    url: url,
    method: method,
    dataType: 'json',
    data: data,
    success: success,
    error: error
  })
}

var expanded_artwork_top;
var expanded_artwork_left;
var $artwork;

function showErrors(errorContainer, errors) {
  var errorsHtml = "<div class='alert alert-danger'>";
  $.each(errors, function(i, error){
    errorsHtml += i+1 + ". " + error + "<br>";
  })
  errorsHtml += "</div>";
  errorContainer.html(errorsHtml)
}

$(document).on('click', '.artwork-wrapper.expandable', function() {
  var $artwork = $(this).find('.artwork');
  expanded_artwork_top = parseInt($artwork.css('top'));
  expanded_artwork_left = parseInt($artwork.css('left'));
  console.log(expanded_artwork_top);
  var first_artwork_offset = $(".artworks-wrapper").first().offset().top;
  console.log(first_artwork_offset);
  $artwork.addClass('pre-expanded');
  $('.artwork').not('.pre-expanded').addClass('inivisible');
  $artwork.addClass('expanded');
  $artwork.removeClass('pre-expanded');
  $artwork.css(
    {
      height: ($(window).height()),
      top: 0,
      left: '-15px',
      width: 'calc(100% + 30px)',
      
    }
  )
  $artwork.parent().removeClass('expandable');
});

$(document).on('click', '.artwork-wrapper .collapse', function() {
  var $artwork = $('.artwork.expanded');
  $artwork.removeClass('expanded');
  $artwork.css({
    height: '',
    top: expanded_artwork_top,
    left: expanded_artwork_left,
    width: ''
  })
  expanded_artwork_top = 0;
  $('.artwork.inivisible').removeClass('inivisible');
  $artwork.parent().addClass('expandable');
})
