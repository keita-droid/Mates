class Api::V1::GroupsController < ApplicationController
  def create
    group = Group.new(group_params)
    if group.save
      groups = current_user.groups
      render json: groups
    else
      render json: group.errors, status: 422
    end
  end

  private
  
  def group_params
    params.require(:group).permit(:name, :description, :public)
  end
end
