class PostsController < ApplicationController

  def create
    post = Post.new(post_params)
    post.save
    redirect_to user_path(current_user), notice: "投稿しました"
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if current_user.id == post.user_id
    redirect_to user_path(post.user), notice: "投稿内容を変更しました"
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy if current_user == post.user
    redirect_to user_path(post.user), notice: "投稿を削除しました"
  end


  private
  def post_params
    params.require(:post).permit(:text, :user_id, :genre_id, :updated_at)
  end
end
