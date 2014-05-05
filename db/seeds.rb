ActionMailer::Base.delivery_method = :test

#admin_user = User.create!(full_name: "Admin User",  email: "admin@admin.com",  password: "admin", password_confirmation: "admin")


org = Organization.create!(name: "Best Travel Agency")
org.campaigns.create!(title: org.name, pilot_number: "5551234567")


[
 { full_name: 'John Smith', email: 'john@best.com' },
 { full_name: 'Andrew Twirls', email: 'andrew.berls@gmail.com' },
 { full_name: 'Nivedh Mohinder', email: 'nivedh.mudaliar@gmail.com' },
 { full_name: 'Alex Timber', email: 'awood314@gmail.com' },
 { full_name: 'Pete Cruise', email: 'petesta@live.com' },
 { full_name: 'Servin Shakes', email: 'shervinater@gmail.com' }
].each do |user_attrs|
  org.users.create!(user_attrs.merge(password: "password", password_confirmation: "password"))
end


