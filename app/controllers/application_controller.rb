class ApplicationController < ActionController::Base
  before_action :load_artists
  helper_method :expandable
  
  private
  
  def load_artists
    @artists = Artist.all.order(:name)
  end
  
  def expandable
    @expandable ? 'expandable' : ''
  end
end
