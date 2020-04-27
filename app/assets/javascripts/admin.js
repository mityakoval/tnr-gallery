$(document).on('turbolinks:load', function() {
    $("#createArtistButton").click(function(e) {
      data = {
        artist: {
          full_name: $("#artist_name").val(),
          description: $("#artist_description").val(),
          currency: $("#artist_currency").val()
        }
      }
      
      invoke("/admin/artists", "post", data, function(resp) {
        if (resp.errors) {
          showErrors($("#newArtistModal .errors"), resp.errors);
        } else {
          window.location = resp.redirect
        }
      })
    })
});
