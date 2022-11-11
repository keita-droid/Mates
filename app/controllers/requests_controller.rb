class RequestsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @requests = @group.requests.includes(:user)

    unless current_user.in_this_group?(@group)
      redirect_to root_path
    end
  end

  def create
    @group = Group.find(params[:group_id])
    request = Request.new(request_params)
    if request.save
      redirect_to group_path(@group), notice: "送信しました！メンバーからの承認をお待ちください"
    else
      redirect_to group_path(@group)
    end
  end

  def destroy
    group = Group.find(params[:group_id])
    request = Request.find(params[:id])
    request.destroy
    redirect_to group_path(group), notice: "参加リクエストを取り消しました"
  end


  private

  def request_params
    params.permit(:group_id).merge(user_id: current_user.id)
  end
end
