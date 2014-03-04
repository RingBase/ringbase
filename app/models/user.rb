require 'digest/md5'

class User < ActiveRecord::Base
  has_secure_password

  DEFAULT_AVATAR_SIZE = 60 # px

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
    User.where(organization_id: self.organization_id)
        .reject{ |user| user == self }
  end

  def as_json(options)
    {
      id: id,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      avatar_url: avatar_url
    }
  end

  def avatar_url(options={})
    md5  = Digest::MD5.hexdigest(email.downcase)
    url  = "http://www.gravatar.com/avatar/#{md5}"
    size = options.delete(:size) || DEFAULT_AVATAR_SIZE
    url += "?s=#{size}"
    url
  end

  private

  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64
  end
end
