class LogsController < ApplicationController
  before_action :authenticate_user!, :projects

  def new
    @log = Log.new
    @project_options = current_user.projects.where.not(id: @logs).map { |u| [u.name, u.id] }
  end

  def create
    @group = Group.find(session[:current_group])
    @project = Project.find(log_params[:project_id])
    @log = Log.new(group: @group, project: @project)
    if @log.save
      flash[:success] = 'Project Added'
      redirect_to group_path(@group)
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def log_params
    params.require(:log).permit(:project_id)
  end

  def projects
    @logs = Log.all.includes(:project).pluck(:project_id).uniq
  end
end
