class ApplicationController < ActionController::Base
  def log_in!(user)
    user.reset_session_token!
  end 

  def log_out!(user)
    user.reset_session_token! 
    session[:session_token]=nil
  end  

  def log_in? 
    !!current_user
  end  

  def current_user 
    @current_user||=User.find_by_session_token(session[:session_token])
  end   

  def require_sign_in! 
    redirect_to new_session_url unless sign_in?
  end  
end
