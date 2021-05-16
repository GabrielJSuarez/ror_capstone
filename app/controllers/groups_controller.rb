class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[edit update show destroy]

  def index
    @groups = Group.all.order('name ASC').with_attached_group_image.page params[:page]
  end

  def show
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

  def edit; end

  def update
    if @group.update(groups_param)
      flash[:success] = 'Article was successfully updated'
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to groups_path
  end

  private

  def groups_param
    params.require(:group).permit(:name, :group_image)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
