class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    org  = Organization.create!(name: organization_name)
    user = org.users.build(user_params)
    if user.save
      login_user(user)
      redirect_to root_path
    else
      flash[:error] = "Something went wrong!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

  def organization_name
    params.require(:organization_name)
  end
end
