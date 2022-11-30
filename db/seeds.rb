require 'faker'
require 'date'

puts "Clearing database..."
Application.destroy_all
Job.destroy_all
Employer.destroy_all
User.destroy_all

companies = [
            { name: "Ubisoft", city: "Berlin", street: "Hardenbergstraße 32", postcode: 10623, domain: "ubisoft.com", image: "https://static.wikia.nocookie.net/logopedia/images/a/a0/Ubisoft_2017.svg/revision/latest/scale-to-width-down/250?cb=20210110005326" },
            { name: "Electronic Arts", city: "Berlin", street: "Berliner Straße 116", postcode: 10713, domain: "ea.com", image: "https://static.wikia.nocookie.net/logopedia/images/3/3b/EA_2006.svg/revision/latest/scale-to-width-down/200?cb=20200929065523"},
            { name: "Nintendo", city: "Frankfurt am Main", street: "Goldsteinstraße 235", postcode: 60528, domain: "nintendo.de", image: "https://static.wikia.nocookie.net/logopedia/images/b/b0/Nintendo_White_with_Red_background.svg/revision/latest/scale-to-width-down/250?cb=20220219122456" },
            { name: "Activision Blizzard", city: "Berlin", street: "Jägerstraße 32", postcode: 10117, domain: "activision.com", image: "https://static.wikia.nocookie.net/logopedia/images/3/36/Activision_Blizzard.svg/revision/latest/scale-to-width-down/300?cb=20180209111725" }
            ]


recruiters = []
8.times do |index|
  recruiters[index] = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
end

puts "Creating users..."
  password = "123456"
  User.create!({ email: "hinnerk@nerdadvisor.com", password: password, firstName: "Hinnerk", lastName: "Künnen", city: "Berlin", category: "IT Consultant", skills: ["Python", "JavaScript"], image: "https://kitt.lewagon.com/placeholder/users/hkuennen", role: "Job Seeker" })

  User.create!({ email: "aj@nerdadvisor.com", password: password, firstName: "Arjuna", lastName: "Sathianathan", city: "Berlin", category: "Business Developer", skills: ["Ruby on Rails", "JavaScript"], image: "https://kitt.lewagon.com/placeholder/users/ajsath", role: "Job Seeker" })

  User.create!({ email: "adi@nerdadvisor.com", password: password, firstName: "Luthfi Aditya", lastName: "Pratomo", city: "Berlin", category: "Marketing Manager", skills: ["CSS", "JavaScript"], image: "https://kitt.lewagon.com/placeholder/users/Lapratomo24", role: "Job Seeker" })

  User.create!({ email: "juan@nerdadvisor.com", password: password, firstName: "Juan", lastName: "Hurtado", city: "Berlin", category: "Actor", skills: ["Ruby on Rails", "JavaScript"], image: "https://kitt.lewagon.com/placeholder/users/SUMAJU", role: "Job Seeker" })
puts "Users created!"

users = User.all

puts "Creating employers..."
  f_name_0 = recruiters[0].split(" ").first
  l_name_0 = recruiters[0].split(" ").last
  Employer.create!({ companyName: companies[0][:name], image: companies[0][:image], city: companies[0][:city], street: companies[0][:street], postcode: companies[0][:postcode], market: "Videogames", recruiterFirstName: f_name_0, recruiterLastName: l_name_0, recruiterEmail: "#{f_name_0.downcase}.#{l_name_0.downcase}@#{companies[0][:domain]}" })

  f_name_1 = recruiters[1].split(" ").first
  l_name_1 = recruiters[1].split(" ").last
  Employer.create!({ companyName: companies[0][:name], image: companies[0][:image], city: companies[0][:city], street: companies[0][:street], postcode: companies[0][:postcode], market: "Videogames", recruiterFirstName: f_name_1, recruiterLastName: l_name_1, recruiterEmail: "#{f_name_1.downcase}.#{l_name_1.downcase}@#{companies[0][:domain]}" })

  f_name_2 = recruiters[2].split(" ").first
  l_name_2 = recruiters[2].split(" ").last
  Employer.create!({ companyName: companies[1][:name], image: companies[1][:image], city: companies[1][:city], street: companies[1][:street], postcode: companies[1][:postcode], market: "Videogames", recruiterFirstName: f_name_2, recruiterLastName: l_name_2, recruiterEmail: "#{f_name_2.downcase}.#{l_name_2.downcase}@#{companies[1][:domain]}" })

  f_name_3 = recruiters[3].split(" ").first
  l_name_3 = recruiters[3].split(" ").last
  Employer.create!({ companyName: companies[1][:name], image: companies[1][:image], city: companies[1][:city], street: companies[1][:street], postcode: companies[1][:postcode], market: "Videogames", recruiterFirstName: f_name_3, recruiterLastName: l_name_3, recruiterEmail: "#{f_name_3.downcase}.#{l_name_3.downcase}@#{companies[1][:domain]}" })

  f_name_4 = recruiters[4].split(" ").first
  l_name_4 = recruiters[4].split(" ").last
  Employer.create!({ companyName: companies[2][:name], image: companies[2][:image], city: companies[2][:city], street: companies[2][:street], postcode: companies[2][:postcode], market: "Videogames", recruiterFirstName: f_name_4, recruiterLastName: l_name_4, recruiterEmail: "#{f_name_4.downcase}.#{l_name_4.downcase}@#{companies[2][:domain]}" })

  f_name_5 = recruiters[5].split(" ").first
  l_name_5 = recruiters[5].split(" ").last
  Employer.create!({ companyName: companies[2][:name], image: companies[2][:image], city: companies[2][:city], street: companies[2][:street], postcode: companies[2][:postcode], market: "Videogames", recruiterFirstName: f_name_5, recruiterLastName: l_name_5, recruiterEmail: "#{f_name_5.downcase}.#{l_name_5.downcase}@#{companies[2][:domain]}" })

  f_name_6 = recruiters[6].split(" ").first
  l_name_6 = recruiters[6].split(" ").last
  Employer.create!({ companyName: companies[3][:name], image: companies[3][:image], city: companies[3][:city], street: companies[3][:street], postcode: companies[3][:postcode], market: "Videogames", recruiterFirstName: f_name_6, recruiterLastName: l_name_6, recruiterEmail: "#{f_name_6.downcase}.#{l_name_6.downcase}@#{companies[3][:domain]}" })

  f_name_7 = recruiters[7].split(" ").first
  l_name_7 = recruiters[7].split(" ").last
  Employer.create!({ companyName: companies[3][:name], image: companies[3][:image], city: companies[3][:city], street: companies[3][:street], postcode: companies[3][:postcode], market: "Videogames", recruiterFirstName: f_name_7, recruiterLastName: l_name_7, recruiterEmail: "#{f_name_7.downcase}.#{l_name_7.downcase}@#{companies[3][:domain]}" })
puts "Employers created!"

employers = Employer.all

puts "Creating jobs..."
  Job.create!({ title: "Lead Game Designer (f/m/d)", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 66000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "UI Artist (f/m/d)", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 28000, city: companies[0][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "Graphics Programmer (f/m/d)", _type: "Remote", startDate: Date.new(2023,01,15), salary: 52000, city: companies[1][:city], user_id: users[2].id, employer_id: employers[2].id })

  Job.create!({ title: "Gameplay Programmer (f/m/d)", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 44000, city: companies[1][:city], user_id: users[3].id, employer_id: employers[3].id })

  Job.create!({ title: "Software Developer (f/m/d)", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 50000, city: companies[2][:city], user_id: users[0].id, employer_id: employers[4].id })

  Job.create!({ title: "UI/UX Designer (f/m/d)", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 25000, city: companies[2][:city], user_id: users[1].id, employer_id: employers[5].id })

  Job.create!({ title: "Lead Producer (f/m/d)", _type: "Remote", startDate: Date.new(2023,01,15), salary: 62000, city: companies[3][:city], user_id: users[2].id, employer_id: employers[6].id })

  Job.create!({ title: "Senior Technical Level Designer (f/m/d)", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: companies[3][:city], user_id: users[3].id, employer_id: employers[7].id })
puts "Jobs created!"

jobs = Job.all

puts "Creating applications..."
  Application.create!({ cv: "CV", coverLetter: "Cover Letter", user_id: users[0].id, job_id: jobs[0].id, employer_id: employers[0].id })
  Application.create!({ cv: "CV", coverLetter: "Cover Letter", user_id: users[1].id, job_id: jobs[2].id, employer_id: employers[2].id })
  Application.create!({ cv: "CV", coverLetter: "Cover Letter", user_id: users[2].id, job_id: jobs[4].id, employer_id: employers[4].id })
  Application.create!({ cv: "CV", coverLetter: "Cover Letter", user_id: users[3].id, job_id: jobs[6].id, employer_id: employers[6].id })
puts "Applications created!"

puts "Database seeded!"
