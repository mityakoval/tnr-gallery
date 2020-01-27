class ApplicationController < ActionController::Base
  before_action :load_artists
  
  private
  
  def load_artists
    @artists = Artist.all.order(:name)
  end
end
