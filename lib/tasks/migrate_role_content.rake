namespace :migrate do
  desc "Move content from one role to another (DANGER!)."
  task :role_content, %i[old_role_appointment new_role_appointment] => :environment do |_task, args|
    old_role_app = RoleAppointment.find_by!(id: args[:old_role_appointment])
    new_role_app = RoleAppointment.find_by!(id: args[:new_role_appointment])

    old_role_app.edition_role_appointments.each do |era|
      era.update(role_appointment: new_role_app)
    end

    old_role_app.speeches.each do |speech|
      speech.role_appointment = new_role_app
      speech.save!
    end
  end
end
