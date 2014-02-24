ActionMailer::Base.delivery_method = :test

#admin_user = User.create!(full_name: "Admin User",  email: "admin@admin.com",  password: "admin", password_confirmation: "admin")


org = Organization.create!(name: "Best Travel Agency")
org.campaigns.create!(title: org.name, pilot_number: "555-123-4567")


[
 { full_name: 'John Smith', email: 'john@gmail.com' },
 { full_name: 'Jane Doe',   email: 'jane@gmail.com' },
 { full_name: 'Nivedh Mohinder', email: 'nivedh@gmail.com' },
 { full_name: 'Alex Timber', email: 'alex@gmail.com' },
 { full_name: 'Pete Cruise', email: 'pete@gmail.com' },
 { full_name: 'Servin Shake', email: 'servin@gmail.com' }
].each do |user_attrs|
  org.users.create!(user_attrs.merge(password: "password", password_confirmation: "password"))
end


