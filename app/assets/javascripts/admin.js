$(document).on('turbolinks:load', function() {
    $("#createArtistButton").click(function(e) {
      data = {
        artist: {
          name: $("#artist_name").val(),
          description: $("#artist_description").val()
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
