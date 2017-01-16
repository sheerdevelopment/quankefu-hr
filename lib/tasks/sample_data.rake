namespace :db do
  task sample: :environment do
    user = User.create!(email: "admin@admin.com",
      password: "password", password_confirmation: "password",
      user_role_id: UserRole::ADMIN)
  end
end
