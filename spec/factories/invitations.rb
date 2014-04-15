FactoryGirl.define do
  factory :invitation do
    sender { FactoryGirl.create(:user) }
    organization { FactoryGirl.create(:organization) }
    recipient_email { Faker::Internet.email }
    used { false }
  end
end
