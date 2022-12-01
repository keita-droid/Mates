class UserGroupRelationsController < ApplicationController

  def create
    user = User.find(create_params[:user_id])
    group = Group.find(create_params[:group_id])

    # グループからの招待を承認する処理
    invite = Invite.find_by(create_params)
    unless invite.nil?
      group.users << user unless user.in_this_group?(group)
      invite.destroy
      return redirect_to group_path(group), notice: "ようこそ！メンバーに加入しました！"
    end

    # ユーザーからのリクエストを承認する処理
    request = Request.find_by(create_params)
    if current_user.in_this_group?(group)
      group.users << user unless user.in_this_group?(group)
      request.destroy unless request.nil?
    end
    redirect_to group_path(group), notice: "#{user.name}がメンバーに加入しました"
  end

  def destroy
    record = UserGroupRelation.find(params[:id])
    group = record.group
    if group.users.length == 1
      group.destroy
    else
      record.destroy if current_user.id == record.user_id
    end
    redirect_to groups_path, notice: "#{record.group.name}を退会しました"
  end

  private
  def create_params
    params.permit(:group_id, :user_id)
  end
end
