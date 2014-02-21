def rand_digits(n)
  n.times.map { rand(0..9) }.join
end

FactoryGirl.define do
  factory :campaign do
    organization { FactoryGirl.create(:organization) }

    pilot_number do
      # TODO: Faker gives really inconsistently formatted numbers.
      # Need to find a better way for this
      first  = rand_digits(3)
      second = rand_digits(3)
      third  = rand_digits(4)

      "#{first}-#{second}-#{third}"
    end

    title { Faker::Company.name }
  end
end
