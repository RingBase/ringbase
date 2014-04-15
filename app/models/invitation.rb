class Invitation < ActiveRecord::Base
  belongs_to :organization
  belongs_to :sender, class_name: 'User'

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :recipient_email,
    presence: true,
    format: { with: valid_email_regex }

  validates :organization, presence: true
  validates :sender, presence: true

  before_create :generate_token
  after_create :send_invitation_email

  def invalid?
    used
  end

  def mark_used!
    update_attributes!(used: true)
  end

  private

  def send_invitation_email
    InvitationsMailer.invite(self).deliver
  end

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64
    end while self.class.exists?(token: token)
  end
end
