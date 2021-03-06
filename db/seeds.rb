# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dates = ['monday','tuesday','wednesday','thursday','friday']
10.times do
  doctor = Doctor.create(
    name: Faker::Name.doctor_name
  )
end
  10.times do 
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )

    Appointment.create(
      date: dates.sample,
      doctor_id: doctor.id,
      user_id: user.id
    )
  
end

puts "Data Seeded."