class Admin::InterestsController < ApplicationController
   def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      flash[:info] = "#{@interest.name} has been successfully created."
      redirect_to admin_interests_path
    else
      render new_admin_Interest_path
    end
  end

  def edit
    @interest = Interest.find(params[:id])
  end

  def update
     @interest = Interest.find(params[:id])
    if @interest.update_attributes(interest_params)
      flash[:success] = "Interest updated successfully."
      redirect_to admin_interests_path
    else
      render new_admin_Interest_path
    end
  end

    def destroy
    @interest = Interest.find(params[:id]).destroy
    redirect_to admin_interests_path
  end

  private
  def interest_params
      params.require(:interest).permit(:name)
    end
end
