class TicketsController < ApplicationController
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

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = t('model.ticket.controller.notice')
      redirect_to [@project, @ticket]
    else
      flash[:alert] = t('model.ticket.controller.alert')
      render :action => "new"
    end
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
