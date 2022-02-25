class RequestsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @request = Request.new
  end

  def create
    @group = Group.find(params[:group_id])
    request = Request.new(request_params)
    if request.save
      render :create
    else
      redirect_to group_path(@group)
    end
  end

  private

  def request_params
    params.permit(:group_id).merge(user_id: current_user.id)
  end
end
