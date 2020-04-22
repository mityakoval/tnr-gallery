class ApplicationController < ActionController::Base
  before_action :load_artists
  helper_method :expandable
  
  private
  
  def load_artists
    @artists = [Artist.not_categories.order(:last_name).to_a, Artist.categories.to_a].flatten
  end
  
  def expandable
    @expandable ? 'expandable' : ''
  end
end
