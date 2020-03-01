class Admin::ArtworksController < AdminController
  before_action :set_artist, only: [:create, :delete]
  before_action :set_artwork, only: [:show, :edit, :update, :delete]
  
  def index
    @artworks = Artwork.includes(:artist).order('artists.name ASC')
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    artwork.artist = @artist
    if artwork.save
      @artist.add_artwork(artwork)
      redirect_to admin_artwork_path(id: artwork.id)
    else
      
    end
  end
  
  def update
    if @artwork.update(artwork_params)
      redirect_to admin_artwork_path(id: @artwork.id)
    else
      flash.now[:danger] = "unable to update"
      render :edit
    end
  end
  
  def delete
    @artwork.destroy
    redirect_to admin_artworks_path(artist_id: @artist.id)
  end
  
  private
  
  def artwork_params
    params.fetch(:artwork, {}).permit(
      :name,
      :description,
      :picture,
      :price
    )
  end
  
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end
end
