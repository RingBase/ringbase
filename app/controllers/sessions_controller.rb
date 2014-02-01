class SessionsController < ApplicationController

  def new
    #return redirect_to expenses_path if signed_in?
  end

  def create
    user = User.find_by_email(params[:email])

    authenticated = false
    if user && user.authenticate(params[:password])
      authenticated = true
      login_user(user)
    end

    redirect_to root_path
  end

  def destroy
    cookies.delete(:auth_token)
    return redirect_to root_url
  end

end
