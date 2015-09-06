class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
    @classifications = Classification.all
    @districts = District.all
    @interests = Interest.all
  end

   def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      current_user.organisation_id = @organisation.id
      flash[:info] = "You have completed the registration process."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  private
  def organisation_params
      params.require(:organisation).permit(:name, :address_1, :address_2, 
                                   :town, :county, :postcode, :description, :website, :user_id, :classification_id, 
                                   :district_ids => [], :interest_ids => [])
    end
end
