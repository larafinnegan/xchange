class AlertsController < ApplicationController

  def new
    individual = current_user.individual
    @alert = individual.alerts.build
    @skills = Skill.all
    @interests = Interest.all
  end

  def create
    individual = current_user.individual
    @alert = individual.alerts.build(alert_params)
    if @alert.save
      redirect_to individual_alerts_path(individual)
    else
      render 'new'
    end
  end

  def index
    @alerts = current_user.individual.alerts.all
  end

   def edit
    @alert = Alert.find(params[:id])
    @skills = Skill.all
    @interests = Interest.all
  end

  def update
    @alert = Alert.find(params[:id])
    if @alert.update_attributes(alert_params)
      redirect_to individual_alerts_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @alert = Alert.find(params[:id]).destroy
    redirect_to individual_alerts_path(current_user)
  end

  private

  def alert_params
    params.require(:alert).permit(:name, :postcode, :distance, :under_18, :group, 
                            :expert, :search_id, :skill_ids => [], :interest_ids => [])
  end
end
