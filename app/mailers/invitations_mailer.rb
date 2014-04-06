class InvitationsMailer < ActionMailer::Base
  default from: "invitations@ringbase.io"

  def invite(invitation)
    @invitation   = invitation
    @organization = @invitation.organization
    @sender       = @invitation.sender
    @subject      = "Invitation to join #{@organization.name} on Ringbase"

    mail to: @invitation.recipient_email, subject: @subject
  end

end
