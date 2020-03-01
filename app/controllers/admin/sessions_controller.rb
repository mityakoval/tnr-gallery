class Admin::SessionsController < AdminController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(username: session_params[:username])
    
    if user && user.authenticate(session_params[:password])
      log_in(user)
      redirect_to admin_root_url
    else
      flash.now[:danger] = 'Username and password do not match'
      render :new
    end
  end
  
  def delete
    # code
  end
  
  private
  
  def session_params
    params.fetch(:session, {}).permit(
      :username,
      :password
    )
  end
end
