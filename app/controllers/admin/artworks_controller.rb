class Admin::ArtworksController < AdminController
  before_action :set_artist, only: [:create]
  
  def show
    @artwork = Artwork.find(params[:id])
  end
  
  def edit
    # code
  end
  
  def create
    artwork = Artwork.new(artworks_params)
    
    if artwork.save
      @artist.add_artwork(artwork)
      redirect_to admin_artwork_path(id: artwork.id)
    else
      
    end
  end
  
  def update
    # code
  end
  
  def delete
    # code
  end
  
  private
  
  def artworks_params
    params.fetch(:artwork, {}).permit(
      :name,
      :description,
      :picture
    )
  end
  
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end
