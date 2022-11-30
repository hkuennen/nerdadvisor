require 'faker'
require 'date'

puts "Clearing database..."
Application.destroy_all

Job.destroy_all

empl = User.all
empl.each do |e|
  e.image.purge
end
Employer.destroy_all

usr = User.all
usr.each do |u|
  u.image.purge
end
User.destroy_all
puts "Database cleared!"

companies = [
            { name: "Ubisoft", city: "Berlin", street: "Hardenbergstraße 32", postcode: 10623, domain: "ubisoft.com" },
            { name: "Electronic Arts", city: "Berlin", street: "Berliner Straße 116", postcode: 10713, domain: "ea.com" },
            { name: "Nintendo", city: "Frankfurt am Main", street: "Goldsteinstraße 235", postcode: 60528, domain: "nintendo.de" },
            { name: "Activision Blizzard", city: "Berlin", street: "Jägerstraße 32", postcode: 10117, domain: "activision.com" }
            ]


recruiters = []
8.times do |index|
  recruiters[index] = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
end

puts "Creating users..."
  password = "123456"
  hinnerk = User.create!({ email: "hinnerk@nerdadvisor.com", password: password, firstName: "Hinnerk", lastName: "Künnen", city: "Berlin", category: "IT Consultant", skills: ["Python", "JavaScript"], role: "Job Seeker" })
  hinnerk.image.attach(io: File.open("app/assets/images/users/hinnerk.jpg"), filename: "hinnerk.jpg", content_type: "image/jpg")
  
  aj = User.create!({ email: "aj@nerdadvisor.com", password: password, firstName: "Arjuna", lastName: "Sathianathan", city: "Berlin", category: "Business Developer", skills: ["Ruby on Rails", "JavaScript"], role: "Job Seeker" })
  aj.image.attach(io: File.open("app/assets/images/users/aj.jpg"), filename: "aj.jpg", content_type: "image/jpg")
  
  adi = User.create!({ email: "adi@nerdadvisor.com", password: password, firstName: "Luthfi Aditya", lastName: "Pratomo", city: "Berlin", category: "Marketing Manager", skills: ["CSS", "JavaScript"], role: "Job Seeker" })
  adi.image.attach(io: File.open("app/assets/images/users/adi.jpg"), filename: "adi.jpg", content_type: "image/jpg")
  
  juan = User.create!({ email: "juan@nerdadvisor.com", password: password, firstName: "Juan", lastName: "Hurtado", city: "Berlin", category: "Actor", skills: ["Ruby on Rails", "JavaScript"], role: "Job Seeker" })
  juan.image.attach(io: File.open("app/assets/images/users/juan.jpg"), filename: "juan.jpg", content_type: "image/jpg")
puts "Users created!"

users = User.all

puts "Creating employers..."
  f_name_0 = recruiters[0].split(" ").first
  l_name_0 = recruiters[0].split(" ").last
  ubisoft = Employer.create!({ companyName: companies[0][:name], city: companies[0][:city], street: companies[0][:street], postcode: companies[0][:postcode], market: "Videogames", recruiterFirstName: f_name_0, recruiterLastName: l_name_0, recruiterEmail: "#{f_name_0.downcase}.#{l_name_0.downcase}@#{companies[0][:domain]}" })
  ubisoft.image.attach(io: File.open("app/assets/images/employers/ubisoft.jpg"), filename: "ubisoft.jpg", content_type: "image/jpg")
  
  f_name_1 = recruiters[1].split(" ").first
  l_name_1 = recruiters[1].split(" ").last
  ea = Employer.create!({ companyName: companies[0][:name], city: companies[0][:city], street: companies[0][:street], postcode: companies[0][:postcode], market: "Videogames", recruiterFirstName: f_name_1, recruiterLastName: l_name_1, recruiterEmail: "#{f_name_1.downcase}.#{l_name_1.downcase}@#{companies[0][:domain]}" })
  ea.image.attach(io: File.open("app/assets/images/employers/ea.jpg"), filename: "ea.jpg", content_type: "image/jpg")
  
  f_name_2 = recruiters[2].split(" ").first
  l_name_2 = recruiters[2].split(" ").last
  nintendo = Employer.create!({ companyName: companies[1][:name], city: companies[1][:city], street: companies[1][:street], postcode: companies[1][:postcode], market: "Videogames", recruiterFirstName: f_name_2, recruiterLastName: l_name_2, recruiterEmail: "#{f_name_2.downcase}.#{l_name_2.downcase}@#{companies[1][:domain]}" })
  nintendo.image.attach(io: File.open("app/assets/images/employers/nintendo.jpg"), filename: "nintendo.jpg", content_type: "image/jpg")
  
  f_name_3 = recruiters[3].split(" ").first
  l_name_3 = recruiters[3].split(" ").last
  activision = Employer.create!({ companyName: companies[1][:name], city: companies[1][:city], street: companies[1][:street], postcode: companies[1][:postcode], market: "Videogames", recruiterFirstName: f_name_3, recruiterLastName: l_name_3, recruiterEmail: "#{f_name_3.downcase}.#{l_name_3.downcase}@#{companies[1][:domain]}" })
  activision.image.attach(io: File.open("app/assets/images/employers/activision.jpg"), filename: "activision.jpg", content_type: "image/jpg")
puts "Employers created!"

employers = Employer.all

puts "Creating jobs..."
  Job.create!({ title: "Lead Game Designer (f/m/d)", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 66000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "UI Artist (f/m/d)", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 28000, city: companies[0][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "Graphics Programmer (f/m/d)", _type: "Remote", startDate: Date.new(2023,01,15), salary: 52000, city: companies[1][:city], user_id: users[2].id, employer_id: employers[2].id })

  Job.create!({ title: "Gameplay Programmer (f/m/d)", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 44000, city: companies[1][:city], user_id: users[3].id, employer_id: employers[3].id })

  Job.create!({ title: "Software Developer (f/m/d)", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 50000, city: companies[2][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "UI/UX Designer (f/m/d)", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 25000, city: companies[2][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "Lead Producer (f/m/d)", _type: "Remote", startDate: Date.new(2023,01,15), salary: 62000, city: companies[3][:city], user_id: users[2].id, employer_id: employers[2].id })

  Job.create!({ title: "Senior Technical Level Designer (f/m/d)", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: companies[3][:city], user_id: users[3].id, employer_id: employers[3].id })
puts "Jobs created!"

jobs = Job.all

puts "Creating applications..."
  Application.create!({ user_id: users[0].id, job_id: jobs[0].id, employer_id: employers[0].id })
  Application.create!({ user_id: users[1].id, job_id: jobs[2].id, employer_id: employers[1].id })
  Application.create!({ user_id: users[2].id, job_id: jobs[4].id, employer_id: employers[2].id })
  Application.create!({ user_id: users[3].id, job_id: jobs[6].id, employer_id: employers[3].id })
puts "Applications created!"

puts "Database seeded!"
