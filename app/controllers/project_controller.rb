class ProjectController < ApplicationController
  before_action :authenticate_user!
  before_action :projects, only: %i[index external]

  def index; end

  def external; end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(projects_param)
    if @project.save
      flash[:success] = 'Project created successfully!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def projects_param
    params.require(:project).permit(:name, :time)
  end

  def projects
    @projects = Project.includes(:user)
    @projects_with_group = @projects.includes(:groups)
  end
end
