class TicketsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_project
  before_filter :find_ticket, :only => [:show,
                                        :edit,
                                        :update,
                                        :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def show

  end

  def edit

  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = t('model.ticket.controller.create.notice')
      redirect_to [@project, @ticket]
    else
      flash[:alert] = t('model.ticket.controller.create.alert')
      render :action => "new"
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = t('model.ticket.controller.update.notice')
      redirect_to [@project, @ticket]
    else
      flash[:alert] = t('model.ticket.controller.update.alert')
      render :action => "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = t('model.ticket.controller.destrop.notice')
    redirect_to @project
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
