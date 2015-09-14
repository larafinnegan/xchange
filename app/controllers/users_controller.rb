class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @individual = current_user.individual
    @poster = current_user.poster
    @organisations = Organisation.all
    @skills = Skill.all
    @interests = Interest.all
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

private
  def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation, :role, :first_name, :last_name)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
