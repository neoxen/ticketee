class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit

  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = t('model.project.controller.create.notice')
      redirect_to @project
    else
      flash[:alert] = t('model.project.controller.create.alert')
      render :action => "new"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = t('model.project.controller.destrop.notice')
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
  end
end
