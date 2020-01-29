class AdminController < ActionController::Base
  layout 'admin'
  
  before_action :initialize_breadcrumbs
  
  helper_method :breadcrumbs
  helper_method :add_breadcrumb
  
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
