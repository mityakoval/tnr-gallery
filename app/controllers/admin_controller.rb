class AdminController < ActionController::Base
  include Admin::SessionsHelper
  
  layout 'admin'
  
  before_action :initialize_breadcrumbs
  before_action :require_login
  
  helper_method :breadcrumbs
  helper_method :add_breadcrumb
  
  def require_login
    unless current_user
      redirect_to admin_login_url
    end
  end
  
  def initialize_breadcrumbs
    @breadcrumbs = [
      {
        text: 'Artists',
        path: admin_root_path
      }
    ]
  end
  
  def breadcrumbs
    
  end
  
  def add_breadcrumb(text, path)
    breadcrumb = {
      text: text,
      path: path
    }
    @breadcrumbs << breadcrumb
  end
end
