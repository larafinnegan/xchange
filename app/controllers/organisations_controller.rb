class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
  end

   def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user_id = current_user.id
    if @organisation.save
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
      params.require(:organisation).permit(:name, :first_name, :last_name,
                                   :phone, :title, :mobile, :address_1, :address_2, 
                                   :town, :postcode, :description, :website, :user_id)
    end
end
