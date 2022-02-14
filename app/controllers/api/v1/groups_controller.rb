class Api::V1::GroupsController < ApplicationController

  def index
    groups = current_user.groups
    # render json: groups
    respond_to do |format|
      format.json {render json: groups.to_json(:include => [:users])}
    end
  end

  def show
    group = Group.find(params[:id])
    members = group.users
    render json: members
  end

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
