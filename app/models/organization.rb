class Organization < ActiveRecord::Base
  has_many :users

  has_many :campaigns

  def as_json(options={})
    super(include: [:campaigns])
  end
end
