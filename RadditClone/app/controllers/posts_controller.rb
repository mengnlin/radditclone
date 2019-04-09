class PostsController < ApplicationController
  def new 
    @post=Post.new
  end  

  def create 
    @post=Post.new(post_params)
    @post.user_id=current_user.id 
    # @post.sub_id=params[:sub_id]  
    if @post.save 
      redirect_to posts_url
    else
      flash[:errors]=@post.errors.full_messages
      render :new
    end
  end

  def show 
    @post=Post.find(params[:id])
  end  
  
  def edit 
    @post=Post.find(params[:id])
  end  
  
  def update 
    @post=current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else  
      flash[:errors]=@post.errors.full_messages
      render :edit
    end 
  end   

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy 
    redirect_to post_url(@post)
  end   

  def post_params 
    params.require(:post).permit(:title,:url,:content,:sub_id)

end


# sub --> show

# <input type="hidden" name="post[sub_id]" value="<%=@sub.id%>">