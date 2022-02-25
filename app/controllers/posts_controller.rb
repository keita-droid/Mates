class PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if current_user.id == post.user_id
    redirect_to user_path(post.user)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy if current_user == post.user
    redirect_to user_path(post.user)
  end


  private
  def post_params
    params.require(:post).permit(:text, :user_id, :genre_id, :updated_at)
  end
end
