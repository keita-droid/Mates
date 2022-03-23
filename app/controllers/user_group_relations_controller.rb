class UserGroupRelationsController < ApplicationController

  def new
    @user = User.find(params[:id])
    @groups = current_user.groups - @user.groups
  end

  def create
    user = User.find(create_params[:user_id])
    unless create_params[:group_id].blank?
      group = Group.find(create_params[:group_id])
      request = Request.find_by(create_params)
      if current_user.in_this_group?(group)
        group.users << user
        request.destroy unless request.nil?
      end
      redirect_to group_path(group)
    else
      redirect_to user_path(user)
    end
  end

  def destroy
    record = UserGroupRelation.find(params[:id])
    group = record.group
    if group.users.length == 1
      group.destroy
    else
      record.destroy if current_user.id == record.user_id
    end
    redirect_to user_path(current_user), notice: "#{record.group.name}を脱退しました"
  end

  private
  def create_params
    params.permit(:group_id, :user_id)
  end
end
