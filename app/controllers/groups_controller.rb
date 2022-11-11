class GroupsController < ApplicationController
  before_action :set_current_user, only: :create

  def index
    @groups = current_user.groups
    @requests = current_user.requests.includes(:group)
    @group = Group.new
  end

  def show
    @group = Group.find_by(id: params[:id])
    if @group.nil?
      redirect_to root_path, alert: "ERROR: グループが見つかりません"
    elsif @group.users.empty?
      redirect_to root_path, alert: "ERROR: 表示できないグループです"
    else
      @members = @group.users.includes(posts: :genre)
      @request = Request.new
    end
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

    redirect_to group_path(group), notice: "グループ情報を変更しました"
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy if current_user.in_this_group?(group)
    redirect_to root_path, notice: "グループを削除しました"
  end

  def search
    @groups = Group.search(params[:keyword])
  end

  def delete
    @group = Group.find(params[:id])
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :description, :public)
  end

  def set_current_user
    User.current = current_user
  end
end
