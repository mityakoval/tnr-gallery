class Admin::ArtistsController < AdminController
  
  before_action :add_breadcrumbs
  before_action :set_artist, only: [:show, :edit, :update, :delete]
  
  def index
    @artists = Artist.all
  end

  def show
    @artworks = @artist.artworks
    @artwork_link_to = :artwork
    @new_artwork = Artwork.new
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    
    respond_to do |format|
      if artist.save
        format.html { redirect_to admin_artist_url(id: artist.id) }
        format.json { render json: { redirect: admin_artist_url(id: artist.id) } }
        
      else
        format.html do
          flash[:danger] = artist.errors.full_messages.join("\n")
          redirect_to admin_all_artists_url
        end
        format.json { render json: { errors: artist.errors.full_messages } }
      end
    end
  end

  def edit
    @artworks = @artist.artworks    
  end

  def update  
    if @artist.update(artist_params)
      redirect_to admin_artist_url(id: @artist.id)
    else
      flash.now[:danger] = @artist.errors.full_messages.join("\n")
      @artworks = @artist.artworks
      render :edit
    end
  end

  def delete
    @artist.destroy
    redirect_to admin_all_artists_path
  end
  
  private
  
  def artist_params
    params.fetch(:artist, {}).permit(:full_name, :description, :is_category, :currency)
  end
  
  def set_artist
    @artist = Artist.find(params[:id])
  end
  
  def add_breadcrumbs
    @artist = Artist.find_by(id: params[:id])
    add_breadcrumb @artist.full_name, nil if @artist
  end
end
