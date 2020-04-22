class Admin::ArtworksController < AdminController
  before_action :set_artist, only: [:show, :create, :delete, :update, :edit]
  before_action :set_artwork, only: [:show, :edit, :update, :delete]
  before_action :add_breadcrumbs
  before_action :show_breadcrumbs
  
  def index
    @artworks = Artwork.includes(:artist).order('artists.last_name ASC')
  end
  
  def show
    @current_link = false
  end
  
  def edit
    @artist = @artwork.artist
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    artwork.artist = @artist
    if artwork.save
      @artist.add_artwork(artwork)
      redirect_to admin_artwork_path(artist_id: @artist.id, id: artwork.id)
    else
      
    end
  end
  
  def update
    if @artwork.update(artwork_params)
      redirect_to admin_artwork_path(artist_id: @artist.id, id: @artwork.id)
    else
      flash.now[:danger] = "unable to update"
      render :edit
    end
  end
  
  def delete
    @artwork.destroy
    redirect_to admin_artist_path(id: @artist.id)
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
  
  def add_breadcrumbs
    add_breadcrumb @artist.full_name, admin_artist_path(id: @artist.id) if @artist ||= Artist.find_by(id: params[:artist_id])
  end
  
  def show_breadcrumbs
    @show_breadcrumbs = false
  end
end
