class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to (user.role == "Volunteer" ?  new_individual_path : new_poster_path)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
