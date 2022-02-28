class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("updated_at DESC")
    @new_post = Post.new
    @genres = Genre.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) if user.id == current_user.id

    redirect_to user_path(user)
  end

  def search
    @users = User.search(params[:keyword])
  end

  private
  def user_params
    params.require(:user).permit(:name, :status, :description, :account_name, :image)
  end
end
