# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a sample course
course = Course.find_or_create_by!(name: "Corso Agonistico") do |c|
  c.start_time = "18:30"
  c.end_time = "20:00"
  c.description = "Corso dedicato a chi vuole competere a livello agonistico, con allenamenti intensivi e focus sulla tecnica avanzata."
end

course = Course.find_or_create_by!(name: "Corso Amatori Pomeridiani") do |c|
  c.start_time = "13:00"
  c.end_time = "14:00"
  c.description = "Corso dedicato a chi vuole praticare la boxe a livello amatoriale, con allenamenti più leggeri e focus sul fitness e divertimento."
end

course = Course.find_or_create_by!(name: "Corso Amatori Giovani") do |c|
  c.start_time = "17:00"
  c.end_time = "18:30"
  c.description = "Corso dedicato a giovani atleti amatori, con allenamenti adatti alla loro età e focus sulla tecnica di base e divertimento."
end

course = Course.find_or_create_by!(name: "Corso Amatori Serali") do |c|
  c.start_time = "20:00"
  c.end_time = "21:00"
  c.description = "Corso dedicato a chi vuole praticare la boxe a livello amatoriale, con allenamenti più leggeri e focus sul fitness e divertimento."
end

# Create a sample user
user = User.find_or_create_by!(email: "atleta@example.com") do |u|
  u.password = "password123"
end

# Create profile for the user
profile = Profile.find_or_create_by!(user: user) do |p|
  p.first_name = "Mario"
  p.last_name = "Rossi"
  p.profile_type = :atleta_agonista
end

# Create athlete details for the profile
athlete_detail = AthleteDetail.find_or_create_by!(profile: profile) do |ad|
  ad.fpi_card_id = "TESS12345"
  ad.wins = 5
  ad.draws = 1
  ad.losses = 2
  ad.weight = 75.5
  ad.category = "Pesi Medi"
end

# Enroll the profile in the course
enrollment = Enrollment.find_or_create_by!(profile: profile, course: course) do |e|
  e.start_date = Date.today
  e.end_date = Date.today + 1.year
  e.status = :attivo
end
