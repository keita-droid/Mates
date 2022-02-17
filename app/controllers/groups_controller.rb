class GroupsController < ApplicationController
  before_action :set_current_user, only: :create

  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users.includes(:posts)
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :description, :public)
  end

  def set_current_user
    User.current = current_user
  end
end
