class SessionsController < ApplicationController

  def new
    redirect_to root_path if signed_in? # TODO: change URL
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
    return redirect_to root_url # TODO: change URL
  end

end
