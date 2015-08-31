class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = current_user.opportunities.build(opportunity_params)
    if @opportunity.save
      flash[:success] = "Your opportunity has been successfully created!"
      redirect_to @opportunity
    else
      render 'new'
    end
  end

  def edit
    @opportunity = Opportunity.find(params[:id])
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def destroy
    @opportunity = Opportunity.find(params[:id]).destroy
    redirect_to opportunities_path
  end

  def index
    @opportunities = Opportunity.all
  end

  def opportunity_params
      params.require(:opportunity).permit(:name, :last_name,
                                   :phone, :town, :postcode, :additional_skills, :user_id, 
                                   :tasks, :commitment, :close, :expire, :benefits,
                                   :reimburse_expenses, :additional_information, :under_18,
                                   :expert, :general, :group)
    end
end
