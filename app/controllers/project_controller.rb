class ProjectController < ApplicationController
  def index
    @projects = Project.all.page params[:page]
  end

  def new
  end

  def create
  end

  def show
  end
end
