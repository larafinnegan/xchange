class ApplicationsController < ApplicationController

  def new
    opportunity = Opportunity.find(params[:opportunity_id])
    @application = opportunity.applications.build
  end

  def create
    opportunity = Opportunity.find(params[:opportunity_id])
    @application = opportunity.applications.build(params[:application_params])
    if @application.save
      @application.submit_application_email
      flash[:info] = "Your application has been successfully submitted."
      redirect_to opportunity_path(opportunity)
    else
      render 'new'
    end
  end

  def index
    @applications = current_user.individual.applications
  end

  private 




end
