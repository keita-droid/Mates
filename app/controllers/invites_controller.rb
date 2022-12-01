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
    invite = Invite.find(params[:id])
    invite.destroy
    redirect_to user_path(user), notice: "招待を辞退しました"
  end


  private

  def invite_params
    params.permit(:group_id, :user_id)
  end
end
