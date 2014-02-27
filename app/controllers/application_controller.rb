class ApplicationController < ActionController::Base

  protect_from_forgery

  ACCESS_DENIED_PATH = '/'

  helper_method :current_user, :signed_in?, :login_user, :current_organization

  def must_be_logged_in
    respond_to do |format|
      format.html {
        authorized = signed_in?
        reject_unauthorized(authorized, path: login_path)
      }
      format.json {}
      format.js {}
    end
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  rescue ActiveRecord::RecordNotFound
    cookies.delete(:auth_token)
    redirect_to login_path
  end

  def current_organization
    @current_organization = Organization.find_by_id(current_user.organization_id)
  end

  def signed_in?
    current_user.present?
  end

  def login_user(user)
    cookies[:auth_token] = user.auth_token
  end

  def reject_unauthorized(authorized=false, options={})
    path = options.delete(:path) || ACCESS_DENIED_PATH

    unless authorized
      respond_to do |format|
        format.html { return redirect_to path }
        format.json { return render json: {} }
      end
    end
  end

end
