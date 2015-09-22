class OpportunitiesController < ApplicationController
  def new
    @opportunity = Opportunity.new
    @opportunity.first_name = current_user.first_name
    @opportunity.last_name = current_user.last_name
    @opportunity.email = current_user.email
    @opportunity.phone = current_user.poster.phone
    @opportunity.title = current_user.poster.title
    @skills = Skill.all
  end

  def create
    @skills = Skill.all
    @opportunity = current_user.opportunities.build(opportunity_params)
    @opportunity.organisation_id = current_user.poster.organisation.id
    if @opportunity.save
      flash[:success] = "Your opportunity has been successfully created!"
      redirect_to @opportunity
    else
      render 'new'
    end
  end

  def edit
    @skills = Skill.all
    @opportunity = Opportunity.find(params[:id])
  end

   def update
    @skills = Skill.all
    @opportunity = Opportunity.find(params[:id])
    if @opportunity.update_attributes(opportunity_params)
      redirect_to @opportunity
    else
      render :edit
    end
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def destroy
    @opportunity = Opportunity.find(params[:id]).destroy
    redirect_to opportunities_path
  end

  def index
    @opportunities = current_user.poster.organisation.opportunities.all
    @organisation = current_user.poster.organisation
  end

  private

  def opportunity_params
      params.require(:opportunity).permit(:name, :title, :email, :phone, :town, 
                                    :postcode, :additional_skills, :first_name, :last_name, 
                                   :organisation_id, :tasks, :commitment, :close, :benefits,
                                   :reimburse_expenses, :additional_information, :under_18,
                                   :expert, :group, :skill_ids => [])
    end
end
