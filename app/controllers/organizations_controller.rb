class OrganizationsController < ApplicationController

  before_filter :must_be_logged_in, except: [:complete_invitation]

  skip_before_filter :verify_authenticity_token, only: [:invitations]

  # View
  def invite
  end

  def invitations
    @organization = Organization.find(params[:id])

    invitation_email_params.each do |email|
      Invitation.create!(organization: @organization,
                         sender: current_user, recipient_email: email)
    end

    redirect_to dashboard_path
  end


  def complete_invitation
    @invitation = Invitation.find_by(token: params[:token])

    if request.get?
      @user = User.new
      render
    else
      @user = User.new(user_params) do |u|
        u.email = @invitation.recipient_email
      end
      @invitation.organization.users << @user

      if @user.save
        login_user(@user)
        redirect_to dashboard_path
      else
        render :complete_invitation
      end
    end
  end

  private

  def invitation_email_params
    params.require(:invitations).map { |_, attrs| attrs['recipient_email'] }
  end

  def user_params
    params.permit(:full_name, :password, :password_confirmation)
  end

end
