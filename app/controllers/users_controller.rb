class UsersController < ApplicationController
  respond_to :json

  def new
    @user = User.new
  end

  def create
    org  = Organization.create!(name: organization_name)
    org.campaigns.create!(title: organization_name,
                          pilot_number: pilot_number) # TODO: title ?
    user = org.users.build(user_params)

    if user.save
      login_user(user)
      redirect_to dashboard_path
    else
      flash[:error] = "Something went wrong!"
      render :new
    end
  end

  def index
    respond_with current_user.peers.to_json
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

  def organization_name
    params.require(:organization_name)
  end

  def pilot_number
    params.require(:pilot_number)
  end
end
