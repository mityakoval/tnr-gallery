class Admin::ArtistsController < AdminController
  def index
    @artists = Artist.all.order(:name)
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
  end

  def update
  end

  def delete
  end
  
  private
  
  def artist_params
    params.fetch(:artist, {}).permit(:name, :description)
  end
end
