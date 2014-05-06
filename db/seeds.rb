ActionMailer::Base.delivery_method = :test

#admin_user = User.create!(full_name: "Admin User",  email: "admin@admin.com",  password: "admin", password_confirmation: "admin")


org = Organization.create!(name: "Best Travel Agency")
org.campaigns.create!(title: org.name, pilot_number: "5551234567") # TODO: number


[
 { full_name: 'John Smith', email: 'john@best.com', phone_number: '7073227256' },
 { full_name: 'Andrew Twirls', email: 'andrew.berls@gmail.com', phone_number: '7073227256' },
 { full_name: 'Nivedh Mohinder', email: 'nivedh.mudaliar@gmail.com', phone_number: '4083489187' },
 { full_name: 'Alex Timber', email: 'awood314@gmail.com', phone_number: '8054058403' },
 { full_name: 'Pete Cruise', email: 'petesta@live.com', phone_number: '5598275517' },
 { full_name: 'Servin Shakes', email: 'shervinater@gmail.com', phone_number: '9494194942' }
].each do |user_attrs|
  org.users.create!(user_attrs.merge(password: "password", password_confirmation: "password"))
end


