class ProjectsController < ApplicationController
  def index

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = t('model.project.controller.notice')
      redirect_to @project
    else
      flash[:alert] = t('model.project.controller.alert')
      render :action => "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
