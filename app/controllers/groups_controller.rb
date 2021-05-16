class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all.order('name ASC').with_attached_group_image.page params[:page]
  end

  def show
    @group = Group.find(params[:id])
    session[:current_group] = @group.id
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(groups_param)
    if @group.save
      flash[:success] = 'Group created!'
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def groups_param
    params.require(:group).permit(:name, :group_image)
  end
end
