class SubsController < ApplicationController
  before_action :require_sign_in! 

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(param[:id])
  end

  def index 
    @subs = Sub.all
  end

  def create 
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show 
    @sub = Sub.find(param[:id])
  end

  def udpate 
    @sub = current_user.subs.find(params[:id])
    if @sub.udpate_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end 

end
