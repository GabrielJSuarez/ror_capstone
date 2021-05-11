class ProjectController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.all
  end

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

  def projects_params
    params.require(:project).permit(:name, :time)
  end
end
