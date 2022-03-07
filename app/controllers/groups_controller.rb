class GroupsController < ApplicationController
  before_action :set_current_user, only: :create

  def index
    @groups = current_user.groups
    @requests = current_user.requests.includes(:group)
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users.includes(posts: :genre)
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to groups_path, notice: "グループを作成しました"
    else
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params) if current_user.in_this_group?(group)

    redirect_to group_path(group)
  end

  def search
    @groups = Group.search(params[:keyword])
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :description, :public)
  end

  def set_current_user
    User.current = current_user
  end
end
