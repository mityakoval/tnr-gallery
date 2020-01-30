// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
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
  var first_artwork_offset = $(".artworks-wrapper").first().offset().top;
  $artwork.addClass('pre-expanded');
  $('.artwork').not('.pre-expanded').addClass('inivisible');
  $artwork.addClass('expanded');
  $artwork.removeClass('pre-expanded');
  $artwork.css(
    {
      height: ($(window).height() - 40),
      top: -(first_artwork_offset - 33)
    }
  )
  $artwork.parent().removeClass('expandable');
});

$(document).on('click', '.artwork-wrapper .collapse', function() {
  var $artwork = $('.artwork.expanded');
  $artwork.removeClass('expanded');
  $artwork.css({
    height: '',
    top: expanded_artwork_top
  })
  expanded_artwork_top = 0;
  $('.artwork.inivisible').removeClass('inivisible');
  $artwork.parent().addClass('expandable');
})
