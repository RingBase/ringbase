class User < ActiveRecord::Base
  has_secure_password

  validates :full_name, presence: true, length: { maximum: 50 }

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    format: { with: valid_email_regex },
    uniqueness: { case_sensitive: false }

  validates :password, presence: { on: :create },
                       length: { minimum: 5 }, :if => :password_digest_changed?

  belongs_to :organization

  before_create :generate_auth_token

  def peers
    peers = User.where(organization_id: self.organization_id).reject{ |user| user == self }
    peers.to_json({:only => [:full_name, :email, :phone_number]})
  end

  private

  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
end
