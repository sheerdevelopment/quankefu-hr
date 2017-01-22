namespace :db do
  task sample: :environment do
    Faker::Config.locale = "en-GB"

    admin = User.create!(email: "admin@admin.com",
      password: "password", password_confirmation: "password",
      user_role_id: UserRole::ADMIN)

    Employee.find_or_create_by(user: admin).update_attributes(first_name: "Admin", last_name: "SlimHR", gender_id: Gender::MALE,
        line1: Faker::Address.street_address, city: Faker::Address.city,
        postcode: Faker::Address.postcode, country: Faker::Address.country,
        title: "CEO", dob: Faker::Date.birthday, mobile: Faker::PhoneNumber.cell_phone)

    genders = Gender.all

    managers = Department.all.map do |department|
      first_name, last_name = Faker::Name.first_name, Faker::Name.last_name

      user = User.create!(email: "#{first_name}#{Faker::Number.number(3)}@manager.com",
        password: "password", password_confirmation: "password",
        user_role_id: UserRole::MANAGER)

      employee = Employee.find_or_create_by(user: user)
      employee.update_attributes(first_name: first_name, last_name: last_name, gender: genders.sample,
        department: department, line1: Faker::Address.street_address, city: Faker::Address.city,
        postcode: Faker::Address.postcode, country: Faker::Address.country,
        title: "#{department.name} Manager", dob: Faker::Date.birthday, mobile: Faker::PhoneNumber.cell_phone)
      employee
    end

    all_staff = managers.reduce([]) do |result, manager|
      result << manager

      rand(1..40).times do
        first_name, last_name, title = Faker::Name.first_name, Faker::Name.last_name, Faker::Name.title

        user = User.create!(email: "#{first_name}#{Faker::Number.number(6)}@staff.com",
          password: "password", password_confirmation: "password",
          user_role_id: UserRole::EMPLOYEE)

        employee = Employee.find_or_create_by(user: user)
        employee.update_attributes(first_name: first_name, last_name: last_name, gender: genders.sample,
          department: manager.department, line1: Faker::Address.street_address, city: Faker::Address.city,
          postcode: Faker::Address.postcode, country: Faker::Address.country,
          title: title, dob: Faker::Date.birthday, mobile: Faker::PhoneNumber.cell_phone)
        result << employee
      end

      result
    end

    project_statues = ProjectStatus.all
    projects = 100.times.map do
      Project.create!(name: Faker::Book.title,
        comment: Faker::Lorem.paragraphs(3).join("\n"),
        status: project_statues.sample)
    end

    projects.take(50).each do |project|
      project_start_date = Faker::Date.between(2.years.ago, Date.today)
      project_end_date = project_start_date + rand(112).days

      rand(1..10).times do
        staff = all_staff.sample

        work_date = Faker::Date.between(project_start_date, project_end_date)
        start_time = Faker::Time.between(work_date, work_date, :day)
        end_time = start_time + rand(0..7).hours + rand(0..59).minutes

        Diary.create!(project: project, employee: staff, notes: Faker::Lorem.paragraph,
          start: start_time, end: end_time)
      end
    end

    absence_statues = AbsenceStatus.all
    AbsenceType.all.each do |absence_type|
      rand(50..200).times do
        staff = all_staff.sample
        absence_start_date = Faker::Date.between(2.years.ago, Date.today)
        absence_end_date = absence_start_date + rand(14).days

        start_time = Faker::Time.between(absence_start_date, absence_start_date, :day)
        end_time = Faker::Time.between(absence_end_date, absence_end_date, :day)

        Absence.create!(user: staff.user,
          type: absence_type, status: absence_statues.sample,
          comments: Faker::Lorem.paragraph, start: start_time, end: end_time)
      end
    end
  end
end
