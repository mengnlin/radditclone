class SessionsController < ApplicationController 
  def new 
  end  

  def create 
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid Credentials!"]
      render :new
    end
  end 

  def destroy
    @user = User.find(params[:id])
    @user.reset_session_token!
    redirect_to new_session_url
  end

end
