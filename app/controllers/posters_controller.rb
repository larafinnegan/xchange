class PostersController < ApplicationController
  def new
    @poster = Poster.new
    @organisations = Organisation.all
  end

   def edit
  end

  def update
    @user = current_user
    @poster = current_user.poster
    if @poster.update_attributes(poster_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @poster = Poster.new(poster_params)
    @poster.user_id = current_user.id
    if @poster.save
      flash[:info] = "You have completed the registration process."
      redirect_to (@poster.organisation_id ? root_url : new_organisation_path)
    else
      render 'new'
    end
  end

  def show
    @poster = Poster.find(params[:id])
  end

  private
  def poster_params
      params.require(:poster).permit(:phone, :mobile, :title, :user_id, 
                                   :organisation_id, :user_id)
    end
end
