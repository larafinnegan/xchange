class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
    @skills = Skill.all
    @interests = Interest.all
  end

  def edit
  end

  def update
    @user = current_user
    @individual = current_user.individual
    if @individual.update_attributes(individual_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @opportunity = Opportunity.find(params[:opportunity_id])
    @applications = @opportunity.applications.all
  end

  def create
    @skills = Skill.all
    @interests = Interest.all
    @individual = Individual.new(individual_params)
    @individual.user_id = current_user.id
    if @individual.save
      flash[:info] = "You have completed the registration process."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @individual = current_user.individual
    @applications = @individual.applications.all
  end

  private
  def individual_params
      params.require(:individual).permit(:phone, :town, :postcode, :additional_skills, 
                                    :user_id, :skill_ids => [])
    end
end
