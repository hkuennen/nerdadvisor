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
            { name: "343 Industries", city: "Berlin", street: "Storkower 32", postcode: 10407, domain: "343industries.com" }
            { name: "Bethesda Game Studios", city: "Frankfurt am Main", street: "Goldsteinstraße 2", postcode: 10127, domain: "bethesda.net" }
            { name: "Epic Games", city: "Berlin", street: "Unter den Linden 300", postcode: 10317, domain: "epicgames.com" }
            { name: "Guerrilla Games", city: "Berlin", street: "Rudi-Dutschke-Straße 26", postcode: 10969, domain: "guerrilla-games.com" }
            { name: "Riot Games", city: "Frankfurt am Main", street: "Vossstrasse 23", postcode: 10117, domain: "activision.com" }
            { name: "Santa Monica Studio", city: "Berlin", street: "Friedrichstraße 219", postcode: 10969, domain: "activision.com" }
            ]
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
puts "Employers created!"

employers = Employer.all

puts "Creating jobs..."
  Job.create!({ title: "Lead Game Designer (f/m/d)", desc: "As Lead Game Designer you will act in a project leadership capacity to help solve production or creative problems. You will be working closely with the Game Director & Creative Director. You are responsible for building design teams and collaborate with partners. The major focus areas of this position are people management, creativity, communication, problem solving and mitigation.", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 66000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "Junior Voice Actor", desc: "At EA we strive to tell stories within existing and new video game worlds. Want to join us in voicing our next project? You're in luck! We're looking to expand our talent pool of great male actors to work with our lead Creative Director on the voice of our next project. You can work remotely!!! you will be able to be with your family and enjoy your warm home...", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 60000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "German Voice Actor GTA", desc: "Are you based in Berlin and interested in video games? Do you want to put rough German voices for our mafia characters? We are currently seeking German native voice actors in Frankfurt to provide video game voice over. Voice acting for video game voice over recording. Independently recording demo samples at home when considered for a role. Interpreting scripts, deciphering characters, following the instructions of an artistic director and delivering believable performances Requirements: Native German (Berlin). We know you're a tough young man and you can make it.", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 60000, city: companies[2][:city], user_id: users[3].id, employer_id: employers[2].id })

  Job.create!({ title: "UI Artist (f/m/d)", desc: "As a Lead UI Artist, you will be responsible for establishing and driving the direction of UI Art. You will guide the UI Artists in delivering high quality assets and will provide ongoing support to grow the team.", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 28000, city: companies[0][:city], user_id: users[1].id, employer_id: employers[0].id })

  Job.create!({ title: "Sound Designer - Diablo Immortal", desc: "As a Sound Designer, you’ll be work closely with the sound designers, game producers, and designers to bring their characters, creatures, and environments to life. Our Sound Designers are comfortable collaborating with various disciplines to create magical abilities, creatures, UI, VO and environmental audio that compliment and meld seamlessly with gameplay. In addition, each of our Sound Designers record and create original content while utilizing our proprietary game tools to integrate their work into the final product - ensuring that great concepts make the transition from the microphone to the game on the shelves.", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 28000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "Graphics Programmer (f/m/d)", desc: "Want to develop a cutting edge game engine that impacts millions of players around the world? Then come join our PES Team (Procedural Environment Systems) and develop graphics functionalities within the game engine with the goal of creating the best visuals possible!", _type: "Remote", startDate: Date.new(2023,01,15), salary: 52000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[2].id })

  Job.create!({ title: "Gameplay Programmer (f/m/d)", desc: "As part of Avatar: Frontiers of Pandora, you will play an instrumental role in bringing to life the beautiful and dangerous world of Pandora. This is a unique opportunity to keep growing your experience in games while working hand in hand with Disney's creative minds and James Cameron's production company, Lightstorm Entertainment.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 44000, city: companies[3][:city], user_id: users[3].id, employer_id: employers[3].id })

  Job.create!({ title: "Software Developer (f/m/d)", desc: "As a Software Developer, your primary objective is to lead a team of testers and work with developers, artists, and designers to ensure the quality and stability of new features and game content across multiple platforms (PC, PS4, Xbox One) while coordinating with various co-dev partners around the world.", _type: "Fulltime", startDate: Date.new(2022,12,01), salary: 50000, city: companies[2][:city], user_id: users[0].id, employer_id: employers[2].id })

  Job.create!({ title: "AUDIO DESIGNER (f/m/d)", desc: "We are a thriving Community of top technology talent that is globally connected. We design and engineer the products and solutions of many brands that you know and love. No matter where you are on your digital career roadmap, we can help you grow and have fun while doing it. Let’s take this journey together!", _type: "Remote", startDate: Date.new(2022,12,01), salary: 50000, city: companies[2][:city], user_id: users[0].id, employer_id: employers[2].id })

  Job.create!({ title: "UI/UX Designer (f/m/d)", desc: "We are looking for a (Senior) UI/UX Designer to work on our hit game 'Idle Miner Tycoon'. You will be part of the IMT Team designing screens and flows, prototyping, and playtest to improve the user centric experience for a game with over 220 million downloads. Identify future features for the game in an agile and fast-paced environment by developing a deep comprehension of our player's needs and motivations using data, information from the players, and your own F2P knowledge.", _type: "Parttime", startDate: Date.new(2023,01,01), salary: 25000, city: companies[2][:city], user_id: users[1].id, employer_id: employers[2].id })

  Job.create!({ title: "Lead Producer (f/m/d)", desc: "As our new Lead Producer you will be responsible for one of the largest commercially successful games of Ubisoft with millions of concurrent players and a strong E-sport scene. Team-play, intense close quarters confrontations, tactics and explosive action are at the center of the experience for our players.",_type: "Remote", startDate: Date.new(2023,01,15), salary: 62000, city: companies[3][:city], user_id: users[2].id, employer_id: employers[3].id })

  Job.create!({ title: "Senior Technical Level Designer", desc: "A Senior Technical Level Designer is a solution finder and liaison between level designers and other disciplines. They help with shaping the implementation details of complex locations; as well as, creating and integrating reusable location ingredients into the game themselves. They are advocates for production efficiency and quality for world creation by mentoring others and highlighting constraints.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 57000, city: companies[2][:city], user_id: users[3].id, employer_id: employers[2].id })

  Job.create!({ title: "Intermediate Gameplay Programmer", desc: "Join us in building the next great AAA title and see your code run on millions of devices across the world as we create a world for players to enjoy. As an Intermediate Gameplay Programmer, you will develop gameplay elements which facilitate the playability of the game and complex gameplay mechanisms.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 100000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "Gameplay Programmer [FAR CRY Project]", desc: "When you're a Gameplay Programmer at Ubisoft Toronto, you have direct influence over the quality of the game that will end up in the players' hands; there is a tangible link between your work and the player experience. You are entrusted with coding the interactive systems that make the game.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 90000, city: companies[3][:city], user_id: users[0].id, employer_id: employers[3].id })

  Job.create!({ title: "Senior Animator", desc:"The animation department is a small hub of creative and hardworking artists from many diverse backgrounds where professionalism, trust, and fun rub shoulders every day. The animation department is currently growing and looking to onboard new teammates. We are looking forward to new projects with new challenges and high-quality work deliveries.", _type: "Fulltime", startDate: Date.new(2023,02,01), salary: 237000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[1].id })

  Job.create!({ title: "Roto Paint Artist", desc: "Paint out rigs and wires using Nuke and other relevant software", _type: "Partime", startDate: Date.new(2023,02,01), salary: 667000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[2].id })

  Job.create!({ title: "Generalist Programmer [Rainbow Six Mobile]", desc:"As a Generalist Programmer, you are the Swiss Army knife of your project. You support wherever needed, able to adapt to any programming challenge thrown your way. You’ll contribute to anything from gameplay programming to crafting tools for the upcoming Rainbow Six Mobile, an ambitious AAA mobile game developed in partnership with teams around the world.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 97000, city: companies[3][:city], user_id: users[3].id, employer_id: employers[3].id })

  Job.create!({ title:"C++ Programmer [Snowdrop]", desc: "You put your C++ skills to work on any problem in need of a solution. Whether it’s working on productions built in Snowdrop or contributing to the engine itself, you’re there to support – able to adapt to any programming challenge thrown at the studio. Snowdrop is a powerful game engine that enables Ubisoft content creators to set their creative minds free. Fast and flexible, Snowdrop gives developers innovative tools designed from the ground up for creating the unknown. This engine will power upcoming titles like Avatar: Frontiers of Pandora, the Star Wars Project, and the newly announced Splinter Cell remake.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 17000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[0].id })

  Job.create!({ title: "Gameplay Animator [Star Wars Project]", desc: "As a Gameplay Animator at Ubisoft Paris you will be working together with the team at Massive Entertainment to create a new story-driven open-world video game set in the Star Wars galaxy. Our goal is to create a game and a story that bring both new and lifelong fans on an immersive and outstanding journey, which will stay with them for years to come.", _type: "Office-Based", startDate: Date.new(2023,02,01), salary: 57000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[0].id })

  Job.create!({ title: "Web Programmer", desc: "As part of our web development team, you will be involved in creating the latest features of our web applications as well as supporting the connected features of our games. Your tasks will range from front-end interface development, to debugging, to back-end service development. As a member of an agile team, your work will be done in close collaboration with our UX designers, game designers, and testers. In addition, you will research and identify the best solutions to the technical challenges we face on our journey and constantly discover new ways to improve our work methods.", _type: "Part-Time", startDate: Date.new(2023,02,01), salary: 1007000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[1].id })

  Job.create!({ title: "Studio Production Director", desc: "As a Production Director, you thrive on placing people at the core of all that you do. Your ability to naturally build rapport and harness relationships will enable you to effectively manage multiple stakeholders and ensure the continued success of our projects. You relish managing multiple projects and are driven by a sense of personal achievement.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 557000, city: companies[3][:city], user_id: users[3].id, employer_id: employers[2].id })

  Job.create!({ title: "Senior Associate Producer [New IP]", desc: "As a Senior Associate Producer, you’ll thrive on facilitating the production of multiple core project features and activities using your project management skills and communicating effectively, across various teams.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 9787000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[3].id })

  Job.create!({ title: "Live Ops Coordinator", desc: "When you’re a Live Operations Coordinator at UbiTO, you’re responsible for the behind-the-scenes prep and posting of the news articles, free events, and promotions that go live on our digital distribution platform, Ubisoft Connect. As the primary point of contact for updating the platform, you plan ahead and publish on time; coordinating, communicating, and collaborating with teams across the company. You collect the information you need internally to share externally, all to ultimately connect players with content related to their favourite Ubisoft games on Ubisoft Connect.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 57000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[0].id })

  Job.create!({ title: "Vulnerability Management Specialist", desc: "As a Vulnerability Management Specialist, you will support the day-to-day vulnerability mitigation activities as well as efforts to implement best practice methods, processes, tools and drive continuous improvement initiatives at Ubisoft. You will be joining Ubisoft within the Security & Risk Management Department – SRM, which is a global team across Europe, Asia, and the Americas. In this role, you will act as a point of contact and facilitator for vulnerability management within Ubisoft’s SRM group. Acting as a bridge between SRM and Ubisoft as a whole, you’ll need to present insightful results in simple, yet, effective business terms.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 992000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[1].id })

  Job.create!({ title: "Intern - IT Support (6 months Internship)", desc: "This job position is to provide technical support to Ubisoft staff of Mumbai and Pune office on using their IT equipment’s. Be responsible for the evaluation, installation and maintenance of staff's computer hardware, software, networks and associated peripherals. Moreover, the person also participates in IT projects to improve users' productivity.", _type: "Office-Based", startDate: Date.new(2023,02,01), salary: 57070, city: companies[3][:city], user_id: users[3].id, employer_id: employers[2].id })

  Job.create!({ title: "Project Manager", _type: "Within i3D.net, the Project Manager is responsible for coordinating and supervising multiple projects simultaneously. The nature of the projects is diverse – you may oversee delivering dedicated servers to one of our customers while you’re also coordinating the build-up of a new PoP in one of our remote data center locations. The Project Manager at i3D.net plays a true pivotal role. You will be working and communicating with every department in the company on a day-to-day basis.", startDate: Date.new(2023,02,01), salary: 227000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[3].id })

  Job.create!({ title: "AI Programmer", desc: "UBISOFT is seeking for AI Programmer having proficiency in C++, Scripting, and strong skills in AI technologies applied to video game programming. Good 3D mathematical skills are required. Interest in video games and knowledge of different video game consoles like Xbox One X/S, PlayStation 4, 5 and other cutting-edge game consoles would be an advantage (But not a requirement). As an AI Programmer you will be working with gameplay team to own at least one aspect of AI in a gameplay interaction system – designing, implementing, and polishing AI behaviors. Another responsibility of AI Programmer is to come up with Tooling solutions for Technical Design.", _type: "Part-Time", startDate: Date.new(2023,02,01), salary: 227000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[0].id })

  Job.create!({ title: "Technical Architect", desc: "As a technical architect at Ubisoft Montreal, you will build and maintain a technology ecosystem that facilitates the work of production teams so that they can invest their time and talent in what counts most: content creation.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 117000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[1].id })

  Job.create!({ title: "Intermediate Gameplay Programmer", desc: "Join us in building the next great AAA title and see your code run on millions of devices across the world as we create a world for players to enjoy. As an Intermediate Gameplay Programmer, you will develop gameplay elements which facilitate the playability of the game and complex gameplay mechanisms.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 570070, city: companies[3][:city], user_id: users[3].id, employer_id: employers[2].id })

  Job.create!({ title: "Intermediate C++ Developer", desc: "We are looking for an Experienced C++ Developer to join our engine team. As a Game Engine Developer you will be on the front line of all dynamic and emerging technologies used to build AAA games, implementing new features and optimizing for various hardware architectures.", _type: "Hybrid", startDate: Date.new(2023,02,01), salary: 57000, city: companies[0][:city], user_id: users[0].id, employer_id: employers[3].id })

  Job.create!({ title: "(Lead) R&D Scientist", desc: "As an R&D Scientist in La Forge China team, you will define our research direction within your own area of expertise, narrowing down our focus to topics that advance public knowledge and help to create world-class games and technologies. You will oversee and develop state-of-the-art prototypes that bring innovations to players and across the company, in domains such as virtual characters and behaviors, digital content creation or systemic environments to name a few.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 527000, city: companies[1][:city], user_id: users[1].id, employer_id: employers[0].id })

  Job.create!({ title: "Network Engineer", desc: "As a Network Engineer, you are part of the infrastructure operations team. This department is responsible for maintaining the global network of i3D.net and its internal servers. Primary work will be monitoring, maintaining, and upgrading the network. You manage or participate in projects and inform your direct colleagues about these projects so they can be delivered on time for our customers.", _type: "Full-Time", startDate: Date.new(2023,02,01), salary: 595000, city: companies[2][:city], user_id: users[2].id, employer_id: employers[3].id })
  puts "Jobs created!"

jobs = Job.all

puts "Creating applications..."
  Application.create!({ user_id: users[0].id, job_id: jobs[0].id, employer_id: employers[0].id })
  Application.create!({ user_id: users[1].id, job_id: jobs[2].id, employer_id: employers[1].id })
  Application.create!({ user_id: users[2].id, job_id: jobs[4].id, employer_id: employers[2].id })
  Application.create!({ user_id: users[3].id, job_id: jobs[6].id, employer_id: employers[3].id })
puts "Applications created!"

puts "Database seeded!"
