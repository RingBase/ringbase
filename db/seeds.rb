ActionMailer::Base.delivery_method = :test


admin_user = User.create!(full_name: "Admin User",  email: "admin@admin.com",  password: "admin", password_confirmation: "admin")
