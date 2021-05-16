class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :projects, only: %i[index external]

  def index
    @projects_with_group_pag = @projects_with_group.page params[:page]
  end

  def external
    @projects_without_group_pag = @projects_without_group.page params[:page]
  end

  def new
    @project = current_user.projects.build
    @groups = Group.all.map { |u| [u.name, u.id] }
  end

  def create
    @project = current_user.projects.build(projects_param)
    if @project.save
      flash[:success] = 'Project created successfully!'
      redirect_to external_path
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
    @logs = Log.all.includes(:project).pluck(:project_id).uniq
    @projects_with_group = current_user.projects.where(id: @logs).order('created_at DESC')
    @projects_without_group = current_user.projects.where.not(id: @logs).order('created_at DESC')
  end
end
