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
    @group = Group.all
    @groups = @group.map { |u| [u.name, u.id] }
  end

  def create
    @project = current_user.projects.build(name: projects_param[:name], time: projects_param[:time])
    if @project.save
      @group = Group.find_by(id: projects_param[:groups])
      Log.create(group: @group, project: @project)
      if @group.nil?
        redirect_to external_path
        flash[:success] = 'Project created successfully!'
      else
        flash[:success] = 'Project w/group created successfully!'
        redirect_to projects_path
      end
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def projects_param
    params.require(:project).permit(:name, :time, :groups)
  end

  def projects
    @logs = Log.all.includes(:project).pluck(:project_id).uniq
    @projects_with_group = current_user.projects.where(id: @logs).order('created_at DESC')
    @projects_without_group = current_user.projects.where.not(id: @logs).order('created_at DESC')
  end
end
