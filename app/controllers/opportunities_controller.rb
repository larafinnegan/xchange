class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    @individual.user_id = current_user.id
    if @individual.save
      flash[:info] = "You have completed the registration process."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def show
  end

  def index
    @opportunities = Opportunity.all
  end

  def opportunity_params
      params.require(:opportunity).permit(:first_name, :last_name,
                                   :phone, :town, :postcode, :additional_skills, :user_id)
    end
end
