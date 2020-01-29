class Admin::ArtistsController < AdminController
  
  before_action :add_breadcrumbs
  
  def index
    @artists = Artist.with_preview_artwork
  end

  def show
    @artist = Artist.find(params[:id])
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
    @artist = Artist.find(params[:id])
    @artworks = @artist.artworks
    @new_artwork = Artwork.new
  end

  def update
    @artist = Artist.find(params[:id])
    
    if @artist.update(artist_params)
      redirect_to admin_artist_url(id: @artist.id)
    else
      flash.now[:danger] = @artist.errors.full_messages.join("\n")
      @artworks = @artist.artworks
      render :edit
    end
  end

  def delete
  end
  
  private
  
  def artist_params
    params.fetch(:artist, {}).permit(:name, :description)
  end
  
  def add_breadcrumbs
    @artist = Artist.find_by(id: params[:id])
    add_breadcrumb @artist.name, nil if @artist
  end
end
