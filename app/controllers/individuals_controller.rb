class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
    @skills = Skill.all
    @interests = Interest.all
  end

  def edit
  end

  def index
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

  private
  def individual_params
      params.require(:individual).permit(:phone, :town, :postcode, :additional_skills, 
                                    :user_id, :skill_ids => [], :interest_ids => [])
    end
end
