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
  { name: "Activision Blizzard", city: "Berlin", street: "Jägerstraße 32", postcode: 10117, domain: "activision.com" },
  { name: "343 Industries", city: "Berlin", street: "Storkower 32", postcode: 10407, domain: "343industries.com" },
  { name: "Bethesda Game Studios", city: "Frankfurt am Main", street: "Goldsteinstraße 2", postcode: 10127, domain: "bethesda.net" },
  { name: "Epic Games", city: "Berlin", street: "Unter den Linden 300", postcode: 10317, domain: "epicgames.com" },
  { name: "Guerrilla Games", city: "Berlin", street: "Rudi-Dutschke-Straße 26", postcode: 10969, domain: "guerrilla-games.com" },
  { name: "Riot Games", city: "Frankfurt am Main", street: "Vossstrasse 23", postcode: 10117, domain: "riotgames.com" },
  { name: "Santa Monica Studio", city: "Berlin", street: "Friedrichstraße 219", postcode: 10969, domain: "sms.playstation.com" },
  { name: "Square Enix", city: "Berlin", street: "Urbanstraße 70A", postcode: 10200, domain: "square-enix-games.com" }
  ]

recruiters = []
11.times do |index|
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

juan = User.create!({ email: "juan@nerdadvisor.com", password: password, firstName: "Juan",lastName: "Hurtado", city: "Berlin", category: "Actor", skills: ["Ruby on Rails", "JavaScript"], role: "Job Seeker" })
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
  ea = Employer.create!({ companyName: companies[1][:name], city: companies[1][:city], street: companies[1][:street], postcode: companies[1][:postcode], market: "Videogames", recruiterFirstName: f_name_1, recruiterLastName: l_name_1, recruiterEmail: "#{f_name_1.downcase}.#{l_name_1.downcase}@#{companies[1][:domain]}" })
  ea.image.attach(io: File.open("app/assets/images/employers/ea.jpg"), filename: "ea.jpg", content_type: "image/jpg")

  f_name_2 = recruiters[2].split(" ").first
  l_name_2 = recruiters[2].split(" ").last
  nintendo = Employer.create!({ companyName: companies[2][:name], city: companies[2][:city], street: companies[2][:street], postcode: companies[2][:postcode], market: "Videogames", recruiterFirstName: f_name_2, recruiterLastName: l_name_2, recruiterEmail: "#{f_name_2.downcase}.#{l_name_2.downcase}@#{companies[2][:domain]}" })
  nintendo.image.attach(io: File.open("app/assets/images/employers/nintendo.jpg"), filename: "nintendo.jpg", content_type: "image/jpg")

  f_name_3 = recruiters[3].split(" ").first
  l_name_3 = recruiters[3].split(" ").last
  activision = Employer.create!({ companyName: companies[3][:name], city: companies[3][:city], street: companies[3][:street], postcode: companies[3][:postcode], market: "Videogames", recruiterFirstName: f_name_3, recruiterLastName: l_name_3, recruiterEmail: "#{f_name_3.downcase}.#{l_name_3.downcase}@#{companies[3][:domain]}" })
  activision.image.attach(io: File.open("app/assets/images/employers/activision.jpg"), filename: "activision.jpg", content_type: "image/jpg")

  f_name_4 = recruiters[4].split(" ").first
  l_name_4 = recruiters[4].split(" ").last
  industries = Employer.create!({ companyName: companies[4][:name], city: companies[4][:city], street: companies[4][:street], postcode: companies[4][:postcode], market: "Videogames", recruiterFirstName: f_name_4, recruiterLastName: l_name_4, recruiterEmail: "#{f_name_4.downcase}.#{l_name_4.downcase}@#{companies[4][:domain]}" })
  industries.image.attach(io: File.open("app/assets/images/employers/industries.jpg"), filename: "industries.jpg", content_type: "image/jpg")

  f_name_5 = recruiters[5].split(" ").first
  l_name_5 = recruiters[5].split(" ").last
  bethesda = Employer.create!({ companyName: companies[5][:name], city: companies[5][:city], street: companies[5][:street], postcode: companies[5][:postcode], market: "Videogames", recruiterFirstName: f_name_5, recruiterLastName: l_name_5, recruiterEmail: "#{f_name_5.downcase}.#{l_name_5.downcase}@#{companies[5][:domain]}" })
  bethesda.image.attach(io: File.open("app/assets/images/employers/bethesda.jpg"), filename: "bethesda.jpg", content_type: "image/jpg")

  f_name_6 = recruiters[6].split(" ").first
  l_name_6 = recruiters[6].split(" ").last
  epicGames = Employer.create!({ companyName: companies[6][:name], city: companies[6][:city], street: companies[6][:street], postcode: companies[6][:postcode], market: "Videogames", recruiterFirstName: f_name_6, recruiterLastName: l_name_6, recruiterEmail: "#{f_name_6.downcase}.#{l_name_6.downcase}@#{companies[6][:domain]}" })
  epicGames.image.attach(io: File.open("app/assets/images/employers/epicGames.jpg"), filename: "epicGames.jpg", content_type: "image/jpg")

  f_name_7 = recruiters[7].split(" ").first
  l_name_7 = recruiters[7].split(" ").last
  guerrilla = Employer.create!({ companyName: companies[7][:name], city: companies[7][:city], street: companies[7][:street], postcode: companies[7][:postcode], market: "Videogames", recruiterFirstName: f_name_7, recruiterLastName: l_name_7, recruiterEmail: "#{f_name_7.downcase}.#{l_name_7.downcase}@#{companies[7][:domain]}" })
  guerrilla.image.attach(io: File.open("app/assets/images/employers/guerrilla.jpg"), filename: "guerrilla.jpg", content_type: "image/jpg")

  f_name_8 = recruiters[8].split(" ").first
  l_name_8 = recruiters[8].split(" ").last
  riotGames = Employer.create!({ companyName: companies[8][:name], city: companies[8][:city], street: companies[8][:street], postcode: companies[8][:postcode], market: "Videogames", recruiterFirstName: f_name_8, recruiterLastName: l_name_8, recruiterEmail: "#{f_name_8.downcase}.#{l_name_8.downcase}@#{companies[8][:domain]}" })
  riotGames.image.attach(io: File.open("app/assets/images/employers/riotGames.jpg"), filename: "riotGames.jpg", content_type: "image/jpg")

  f_name_9 = recruiters[9].split(" ").first
  l_name_9 = recruiters[9].split(" ").last
  santaMonica = Employer.create!({ companyName: companies[9][:name], city: companies[9][:city], street: companies[9][:street], postcode: companies[9][:postcode], market: "Videogames", recruiterFirstName: f_name_9, recruiterLastName: l_name_9, recruiterEmail: "#{f_name_9.downcase}.#{l_name_9.downcase}@#{companies[9][:domain]}" })
  santaMonica.image.attach(io: File.open("app/assets/images/employers/santaMonica.jpg"), filename: "santaMonica.jpg", content_type: "image/jpg")

  f_name_10 = recruiters[10].split(" ").first
  l_name_10 = recruiters[10].split(" ").last
  squareEnix = Employer.create!({ companyName: companies[10][:name], city: companies[10][:city], street: companies[10][:street], postcode: companies[10][:postcode], market: "Videogames", recruiterFirstName: f_name_10, recruiterLastName: l_name_10, recruiterEmail: "#{f_name_10.downcase}.#{l_name_10.downcase}@#{companies[10][:domain]}" })
  squareEnix.image.attach(io: File.open("app/assets/images/employers/squareEnix.jpg"), filename: "squareEnix.jpg", content_type: "image/jpg")


puts "Employers created!"

employers = Employer.all

puts "Creating jobs..."
  Job.create!({ title: "Lead Game Designer (f/m/d)", desc: "As Lead Game Designer you will act in a project leadership capacity to help solve production or creative problems. You will be working closely with the Game Director & Creative Director. You are responsible for building design teams and collaborate with partners. The major focus areas of this position are people management, creativity, communication, problem solving and mitigation.", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 66000, city: ubisoft.city, user_id: hinnerk.id, employer_id: ubisoft.id })

  Job.create!({ title: "Junior Voice Actor", desc: "At EA we strive to tell stories within existing and new video game worlds. Want to join us in voicing our next project? You're in luck! We're looking to expand our talent pool of great male actors to work with our lead Creative Director on the voice of our next project. You can work remotely!!! you will be able to be with your family and enjoy your warm home...", _type: "Working Student", startDate: Date.new(2022,12,01), salary: 60000, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "German Voice Actor GTA", desc: "Are you based in Berlin and interested in video games? Do you want to put rough German voices for our mafia characters? We are currently seeking German native voice actors in Frankfurt to provide video game voice over. Voice acting for video game voice over recording. Independently recording demo samples at home when considered for a role. Interpreting scripts, deciphering characters, following the instructions of an artistic director and delivering believable performances Requirements: Native German (Berlin). We know you're a tough young man and you can make it.", _type: "Internship", startDate: Date.new(2022,12,01), salary: 60000, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "UI Artist (f/m/d)", desc: "As a Lead UI Artist, you will be responsible for establishing and driving the direction of UI Art. You will guide the UI Artists in delivering high quality assets and will provide ongoing support to grow the team.", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 48000, city: activision.city, user_id: juan.id, employer_id: activision.id })

  Job.create!({ title: "Sound Designer - Diablo Immortal", desc: "As a Sound Designer, you’ll be work closely with the sound designers, game producers, and designers to bring their characters, creatures, and environments to life. Our Sound Designers are comfortable collaborating with various disciplines to create magical abilities, creatures, UI, VO and environmental audio that compliment and meld seamlessly with gameplay. In addition, each of our Sound Designers record and create original content while utilizing our proprietary game tools to integrate their work into the final product - ensuring that great concepts make the transition from the microphone to the game on the shelves.", _type: "Part-time", startDate: Date.new(2023,01,01), salary: 38000, city: ea.city, user_id: adi.id, employer_id: ea.id })

  Job.create!({ title: "Graphics Programmer (f/m/d)", desc: "Want to develop a cutting edge game engine that impacts millions of players around the world? Then come join our PES Team (Procedural Environment Systems) and develop graphics functionalities within the game engine with the goal of creating the best visuals possible!", _type: "Freelancer", startDate: Date.new(2023,01,15), salary: 52000, city: nintendo.city, user_id: aj.id, employer_id: nintendo.id })

  Job.create!({ title: "Gameplay Programmer (f/m/d)", desc: "As part of Avatar: Frontiers of Pandora, you will play an instrumental role in bringing to life the beautiful and dangerous world of Pandora. This is a unique opportunity to keep growing your experience in games while working hand in hand with Disney's creative minds and James Cameron's production company, Lightstorm Entertainment.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 24000, city: activision.city, user_id: juan.id, employer_id: activision.id })

  Job.create!({ title: "Software Developer (f/m/d)", desc: "As a Software Developer, your primary objective is to lead a team of testers and work with developers, artists, and designers to ensure the quality and stability of new features and game content across multiple platforms (PC, PS4, Xbox One) while coordinating with various co-dev partners around the world.", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 50000, city: nintendo.city, user_id: hinnerk.id, employer_id: nintendo.id })

  Job.create!({ title: "AUDIO DESIGNER (f/m/d)", desc: "We are a thriving Community of top technology talent that is globally connected. We design and engineer the products and solutions of many brands that you know and love. No matter where you are on your digital career roadmap, we can help you grow and have fun while doing it. Let’s take this journey together!", _type: "Freelancer", startDate: Date.new(2022,12,01), salary: 50000, city: nintendo.city, user_id: hinnerk.id, employer_id: nintendo.id })

  Job.create!({ title: "UI/UX Designer (f/m/d)", desc: "We are looking for a (Senior) UI/UX Designer to work on our hit game 'Idle Miner Tycoon'. You will be part of the IMT Team designing screens and flows, prototyping, and playtest to improve the user centric experience for a game with over 220 million downloads. Identify future features for the game in an agile and fast-paced environment by developing a deep comprehension of our player's needs and motivations using data, information from the players, and your own F2P knowledge.", _type: "Part-time", startDate: Date.new(2023,01,01), salary: 25000, city: nintendo.city, user_id: aj.id, employer_id: nintendo.id })

  Job.create!({ title: "Lead Producer (f/m/d)", desc: "As our new Lead Producer you will be responsible for one of the largest commercially successful games of Ubisoft with millions of concurrent players and a strong E-sport scene. Team-play, intense close quarters confrontations, tactics and explosive action are at the center of the experience for our players.",_type: "Freelancer", startDate: Date.new(2023,01,15), salary: 62000, city: activision.city, user_id: adi.id, employer_id: activision.id })

  Job.create!({ title: "Senior Technical Level Designer", desc: "A Senior Technical Level Designer is a solution finder and liaison between level designers and other disciplines. They help with shaping the implementation details of complex locations; as well as, creating and integrating reusable location ingredients into the game themselves. They are advocates for production efficiency and quality for world creation by mentoring others and highlighting constraints.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: nintendo.city, user_id: juan.id, employer_id: nintendo.id })

  Job.create!({ title: "Intermediate Gameplay Programmer", desc: "Join us in building the next great AAA title and see your code run on millions of devices across the world as we create a world for players to enjoy. As an Intermediate Gameplay Programmer, you will develop gameplay elements which facilitate the playability of the game and complex gameplay mechanisms.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 42000, city: ubisoft.city, user_id: hinnerk.id, employer_id: ubisoft.id })

  Job.create!({ title: "Gameplay Programmer [FAR CRY Project]", desc: "When you're a Gameplay Programmer at Ubisoft Toronto, you have direct influence over the quality of the game that will end up in the players' hands; there is a tangible link between your work and the player experience. You are entrusted with coding the interactive systems that make the game.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 90000, city: activision.city, user_id: hinnerk.id, employer_id: activision.id })

  Job.create!({ title: "Senior Animator", desc:"The animation department is a small hub of creative and hardworking artists from many diverse backgrounds where professionalism, trust, and fun rub shoulders every day. The animation department is currently growing and looking to onboard new teammates. We are looking forward to new projects with new challenges and high-quality work deliveries.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 43700, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "Roto Paint Artist", desc: "Paint out rigs and wires using Nuke and other relevant software", _type: "Part-time", startDate: Date.new(2023,02,01), salary: 36700, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "Generalist Programmer [Rainbow Six Mobile]", desc:"As a Generalist Programmer, you are the Swiss Army knife of your project. You support wherever needed, able to adapt to any programming challenge thrown your way. You’ll contribute to anything from gameplay programming to crafting tools for the upcoming Rainbow Six Mobile, an ambitious AAA mobile game developed in partnership with teams around the world.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 15000, city: ubisoft.city, user_id: juan.id, employer_id: ubisoft.id })

  Job.create!({ title:"C++ Programmer [Snowdrop]", desc: "You put your C++ skills to work on any problem in need of a solution. Whether it’s working on productions built in Snowdrop or contributing to the engine itself, you’re there to support – able to adapt to any programming challenge thrown at the studio. Snowdrop is a powerful game engine that enables Ubisoft content creators to set their creative minds free. Fast and flexible, Snowdrop gives developers innovative tools designed from the ground up for creating the unknown. This engine will power upcoming titles like Avatar: Frontiers of Pandora, the Star Wars Project, and the newly announced Splinter Cell remake.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 10000, city: ubisoft.city, user_id: hinnerk.id, employer_id: ubisoft.id })

  Job.create!({ title: "Gameplay Animator [Star Wars Project]", desc: "As a Gameplay Animator at Ubisoft Paris you will be working together with the team at Massive Entertainment to create a new story-driven open-world video game set in the Star Wars galaxy. Our goal is to create a game and a story that bring both new and lifelong fans on an immersive and outstanding journey, which will stay with them for years to come.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 57000, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "Web Programmer", desc: "As part of our web development team, you will be involved in creating the latest features of our web applications as well as supporting the connected features of our games. Your tasks will range from front-end interface development, to debugging, to back-end service development. As a member of an agile team, your work will be done in close collaboration with our UX designers, game designers, and testers. In addition, you will research and identify the best solutions to the technical challenges we face on our journey and constantly discover new ways to improve our work methods.", _type: "Part-time", startDate: Date.new(2023,02,01), salary: 30000, city: ea.city, user_id: adi.id, employer_id: ea.id })

  Job.create!({ title: "Studio Production Director", desc: "As a Production Director, you thrive on placing people at the core of all that you do. Your ability to naturally build rapport and harness relationships will enable you to effectively manage multiple stakeholders and ensure the continued success of our projects. You relish managing multiple projects and are driven by a sense of personal achievement.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 55700, city: nintendo.city, user_id: juan.id, employer_id: nintendo.id })

  Job.create!({ title: "Senior Associate Producer [New IP]", desc: "As a Senior Associate Producer, you’ll thrive on facilitating the production of multiple core project features and activities using your project management skills and communicating effectively, across various teams.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 17800, city: ubisoft.city, user_id: juan.id, employer_id: ubisoft.id })

  Job.create!({ title: "Live Ops Coordinator", desc: "When you’re a Live Operations Coordinator at UbiTO, you’re responsible for the behind-the-scenes prep and posting of the news articles, free events, and promotions that go live on our digital distribution platform, Ubisoft Connect. As the primary point of contact for updating the platform, you plan ahead and publish on time; coordinating, communicating, and collaborating with teams across the company. You collect the information you need internally to share externally, all to ultimately connect players with content related to their favourite Ubisoft games on Ubisoft Connect.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "Vulnerability Management Specialist", desc: "As a Vulnerability Management Specialist, you will support the day-to-day vulnerability mitigation activities as well as efforts to implement best practice methods, processes, tools and drive continuous improvement initiatives at Ubisoft. You will be joining Ubisoft within the Security & Risk Management Department – SRM, which is a global team across Europe, Asia, and the Americas. In this role, you will act as a point of contact and facilitator for vulnerability management within Ubisoft’s SRM group. Acting as a bridge between SRM and Ubisoft as a whole, you’ll need to present insightful results in simple, yet, effective business terms.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 99200, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "Intern - IT Support (6 months Internship)", desc: "This job position is to provide technical support to Ubisoft staff of Mumbai and Pune office on using their IT equipment’s. Be responsible for the evaluation, installation and maintenance of staff's computer hardware, software, networks and associated peripherals. Moreover, the person also participates in IT projects to improve users' productivity.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 58000, city: activision.city, user_id: juan.id, employer_id: activision.id })

  Job.create!({ title: "Project Manager", desc: "Within i3D.net, the Project Manager is responsible for coordinating and supervising multiple projects simultaneously. The nature of the projects is diverse – you may oversee delivering dedicated servers to one of our customers while you’re also coordinating the build-up of a new PoP in one of our Freelancer data center locations. The Project Manager at i3D.net plays a true pivotal role. You will be working and communicating with every department in the company on a day-to-day basis.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 20700, city: ubisoft.city, user_id: hinnerk.id, employer_id: ubisoft.id })

  Job.create!({ title: "AI Programmer", desc: "UBISOFT is seeking for AI Programmer having proficiency in C++, Scripting, and strong skills in AI technologies applied to video game programming. Good 3D mathematical skills are required. Interest in video games and knowledge of different video game consoles like Xbox One X/S, PlayStation 4, 5 and other cutting-edge game consoles would be an advantage (But not a requirement). As an AI Programmer you will be working with gameplay team to own at least one aspect of AI in a gameplay interaction system – designing, implementing, and polishing AI behaviors. Another responsibility of AI Programmer is to come up with Tooling solutions for Technical Design.", _type: "Part-time", startDate: Date.new(2023,02,01), salary: 28000, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "Technical Architect", desc: "As a technical architect at Ubisoft Montreal, you will build and maintain a technology ecosystem that facilitates the work of production teams so that they can invest their time and talent in what counts most: content creation.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 19000, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "Intermediate Gameplay Programmer", desc: "Join us in building the next great AAA title and see your code run on millions of devices across the world as we create a world for players to enjoy. As an Intermediate Gameplay Programmer, you will develop gameplay elements which facilitate the playability of the game and complex gameplay mechanisms.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: activision.city, user_id: juan.id, employer_id: activision.id })

  Job.create!({ title: "Intermediate C++ Developer", desc: "We are looking for an Experienced C++ Developer to join our engine team. As a Game Engine Developer you will be on the front line of all dynamic and emerging technologies used to build AAA games, implementing new features and optimizing for various hardware architectures.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 17000, city: ubisoft.city, user_id: hinnerk.id, employer_id: ubisoft.id })

  Job.create!({ title: "(Lead) R&D Scientist", desc: "As an R&D Scientist in La Forge China team, you will define our research direction within your own area of expertise, narrowing down our focus to topics that advance public knowledge and help to create world-class games and technologies. You will oversee and develop state-of-the-art prototypes that bring innovations to players and across the company, in domains such as virtual characters and behaviors, digital content creation or systemic environments to name a few.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 52700, city: ea.city, user_id: aj.id, employer_id: ea.id })

  Job.create!({ title: "Network Engineer", desc: "As a Network Engineer, you are part of the infrastructure operations team. This department is responsible for maintaining the global network of i3D.net and its internal servers. Primary work will be monitoring, maintaining, and upgrading the network. You manage or participate in projects and inform your direct colleagues about these projects so they can be delivered on time for our customers.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 59500, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "Game Designer", desc: "We are looking for an experienced Game Designer to take good care of the balancing for our newest game’s systems and economy and work together with our core team based in Berlin. We accept remote only candidates but also support moving to Berlin.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 77500, city: bethesda.city, user_id: juan.id, employer_id: bethesda.id })

  Job.create!({ title: "Unity Game Engineer", desc: "As Unity Game Engineer, you will actively help to shape an exciting area of our company and you will be one of the driving forces in the development of games for our web platform. Together with members of our Product, Art, Backend, QA, Game Design as well as Marketing teams, you will create an...", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 17500, city: santaMonica.city, user_id: adi.id, employer_id: santaMonica.id })

  Job.create!({ title: "Senior Software Engineer", desc: "We are looking for a Senior Software Engineer who loves solving complex problems and has a passion for translating complex data into an intuitive UI experience.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 17500, city: squareEnix.city, user_id: aj.id, employer_id: squareEnix.id })

  Job.create!({ title: "Project Audio Director", desc: "As a Project Audio Director, you will collaborate with game directors and central audio teams to deliver AAA calibre audio solutions to our projects. You will lead the project audio development covering the planning, scopes, schedules, R&D, creative and technical developments, implementation, mixing, and optimisations. You will also be supporting the project requirements, vision and any franchise level initiatives and strategies.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 17500, city: epicGames.city, user_id: hinnerk.id, employer_id: epicGames.id })

  Job.create!({ title: "Senior 3D Artist PC and Console Game", desc: "We are working with a PC and console studio based in Germany, Berlin who is looking for a Senior 3D Artist to work on their hit project as well as their exciting new IPs. You will be creating a range of different types of 3D assets and props, and will need to be able to demonstrate a variety of art styles both realistic and cartoony.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 99500, city: guerrilla.city, user_id: juan.id, employer_id: guerrilla.id })

  Job.create!({ title: "Lead Game Designer", desc: "We are partnering with an exciting AAA studio who are rapidly expanding their growth. They are looking for a Lead Game Designer to join their team on an unannounced AAA multiplayer title.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 51500, city: industries.city, user_id: aj.id, employer_id: industries.id })

  Job.create!({ title: "Game Economy Designer", desc: "We are partnering with an amazing games studio based in Frankfurt am Main, who are offering a fully remote position or the opportunity to relocate. You will be working on a new multi-platform multiplayer franchise (Shooter).", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 27500, city: bethesda.city, user_id: hinnerk.id, employer_id: bethesda.id })

  Job.create!({ title: "Games Designer - AAA Racing", desc: "The ethos of this studio is based on working collectively with passionate staff, so they want someone who loves video games first and foremost, and lets this shine through in their attitude and their work. The right candidate will have demonstrable experience in similar positions and be able to communicate their qualities, and will ideally have worked on a high-profile console title in the past. This is a fantastic opportunity to work within a team that champions quality, and works collaboratively to ensure they meet the highest gaming standards.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 97500, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Job.create!({ title: "Principal Game Designer", desc: "The ideal candidate will have experience of full development lifecycles on at least one AAA game title, and will be placed in charge of key areas of the game at every phase from its early development; a successful candidate will translate the game vision set by the Game Director into compelling experiences.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 37504, city: guerrilla.city, user_id: juan.id, employer_id: guerrilla.id })

  Job.create!({ title: "Professor of Game Production", desc: "Educator to join our faculty in support of our popular Game Production Management program embedded within Champlain's renowned Game Studio. The Stiller School's mission is to develop the strengths, integrity, expertise and entrepreneurial mindset of aspiring and innovative professionals to create positive change in their lives, workplaces, communities, and the world.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 10100, city: squareEnix.city, user_id: hinnerk.id, employer_id: squareEnix.id })

  Job.create!({ title: "Mobile Game Producer", desc: "The successful candidate will be responsible for managing the teams, the execution and delivery of the project. Therefore, a strong experience of working in a game development role is essential. As a Mobile Game Producer, you will be managing all aspects of the production team, collaborating with other departments regarding in game features and updating the CEO and any stakeholders on the progress.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 52501, city: epicGames.city, user_id: adi.id, employer_id: epicGames.id })

  puts "Jobs created!"

jobs = Job.all

puts "Creating applications..."
  Application.create!({ user_id: users[0].id, job_id: jobs[0].id, employer_id: employers[0].id })
  Application.create!({ user_id: users[1].id, job_id: jobs[2].id, employer_id: employers[1].id })
  Application.create!({ user_id: users[2].id, job_id: jobs[4].id, employer_id: employers[2].id })
  Application.create!({ user_id: users[3].id, job_id: jobs[6].id, employer_id: employers[3].id })
puts "Applications created!"

puts "Creating Events..."
  Event.create!({ user_id: users[0].id, title: "Clash of Nerds", desc: "Backstage Beat 'Em Hub! Chilled & Casual Gaming Sesh at Sisyfass after an amazing year. Anyone who wants to just meet up, chat and have some drinks while enjoying some chilled gaming, come by!.", _type: "Freelancer", startDate: Date.new(2023,02,01), salary: 27500, city: bethesda.city, user_id: hinnerk.id, employer_id: bethesda.id })

  Event.create!({ user_id: users[1].id, title: "Nerdistan Arcade Bash", desc: "Retro gaming stations, arcade machines, tournament, drinks and old school nerding served as always with great vibes. The event starts at 19.00, tournament starts at 21.00. ", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 97500, city: nintendo.city, user_id: adi.id, employer_id: nintendo.id })

  Event.create!({ user_id: users[2].id, title: "Game Creators Hangout", desc: "The ideal candidate will have experience of full development lifecycles on at least one AAA game title, and will be placed in charge of key areas of the game at every phase from its early development; a successful candidate will translate the game vision set by the Game Director into compelling experiences.", _type: "Internship", startDate: Date.new(2023,02,01), salary: 37504, city: guerrilla.city, user_id: juan.id, employer_id: guerrilla.id })

  Event.create!({ user_id: users[3].id, title: "Nerd beer night", desc: "Educator to join our faculty in support of our popular Game Production Management program embedded within Champlain's renowned Game Studio. The Stiller School's mission is to develop the strengths, integrity, expertise and entrepreneurial mindset of aspiring and innovative professionals to create positive change in their lives, workplaces, communities, and the world.", _type: "Working Student", startDate: Date.new(2023,02,01), salary: 10100, city: squareEnix.city, user_id: hinnerk.id, employer_id: squareEnix.id })

puts "Events created!"


puts "Database seeded!"
