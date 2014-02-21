class Campaign < ActiveRecord::Base
  validates :title, presence: true

  # TODO: validate pilot_number format

  belongs_to :organization
end
