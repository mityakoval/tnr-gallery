class ArtistsController < ApplicationController
  def index
    @artworks = Artwork.preview.includes(:artist).order('artists.name ASC')
  end

  def show
    @artist = Artist.find(params[:id])  
    @artworks = @artist.artworks
    @expandable = true
  end
end
