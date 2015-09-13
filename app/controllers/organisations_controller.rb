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
      p current_user.poster
      p @organisation.id
      current_user.poster.organisation_id = @organisation.id
      current_user.poster.save
      flash[:info] = "#{@organisation.name} has been successfully created."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def index
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  private
  def organisation_params
      params.require(:organisation).permit(:name, :address_1, :address_2, 
                                   :town, :county, :postcode, :description, :website, :twitter, :user_id, :classification_id, 
                                   :district_ids => [], :interest_ids => [])
    end
end
