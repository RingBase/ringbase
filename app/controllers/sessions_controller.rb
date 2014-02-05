class SessionsController < ApplicationController

  def new
    #return redirect_to expenses_path if signed_in?
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      login_user(user)
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    return redirect_to root_url
  end

end
