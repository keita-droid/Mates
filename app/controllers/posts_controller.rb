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

  private
  def post_params
    params.require(:post).permit(:text, :user_id, :genre_id)
  end
end
