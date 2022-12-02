class InvitesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    
    if current_user == @user
      @invites = @user.invites.includes(:group)
    else
      redirect_to root_path, alert: "エラーが発生しました"
    end
  end

  def create
    user = User.find(invite_params[:user_id])
    invite = Invite.new(invite_params)
    if invite.save
      redirect_to user_path(user), notice: "招待を送信しました！"
    else
      redirect_to user_path(user), alert: "エラーが発生しました"
    end
  end

  def destroy
    user = User.find(invite_params[:user_id])
    invite = Invite.find_by(invite_params)
    group = invite.group

    if current_user == user
      # ユーザーが招待を辞退する場合
      invite.destroy
      return redirect_to user_path(user), notice: "招待を辞退しました"
    elsif current_user.in_this_group?(group)
      # グループメンバーが招待を取り消す場合
      invite.destroy
      return redirect_to invites_group_path(group), notice: "招待を取り下げました"
    else
      redirect_to root_path, alert: "エラーが発生しました"
    end

  end


  private

  def invite_params
    params.permit(:id, :group_id, :user_id)
  end
end
