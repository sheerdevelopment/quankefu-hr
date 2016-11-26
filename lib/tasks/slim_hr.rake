# rake 'slim_hr:set_admin[LIST_OF_EMAILS SPACE SEPARATOR]'
namespace :slim_hr do
  desc "Set admin"
  task :set_admin, [:emails] => [:environment] do |t, args|
    emails = args[:emails].split
    emails.each do |email|
      user = User.find_by(email: email)
      if user
        user.user_role_id = UserRole::ADMIN
        user.save
      end
    end
  end
end
