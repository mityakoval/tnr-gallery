class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_preview_artwork
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
