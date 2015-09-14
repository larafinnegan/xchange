class ApplicationsController < ApplicationController

  def new
    opportunity = Opportunity.find(params[:opportunity_id])
    @application = opportunity.applications.build
  end

  def create
    opportunity = Opportunity.find(params[:opportunity_id])
    @application = opportunity.applications.build(application_params)
    @application.individual_id = current_user.individual.id
    if @application.save
      UserMailer.submit_app(@application, @application.resume.read(), @application.resume.original_filename).deliver
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

  def application_params
    params.require(:application).permit(:cover_letter, :resume)
  end

end
