puts "Cleaning users"
User.destroy_all
puts "creating users"

louisa = {email: "louisa@web.de", password: "12345678", name: "Louisa Scheiter", age: 25, profession: "Consultant", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
carla = {email: "carla@web.de", password: "12345678", name: "Carla Schell", age: 22, profession: "Manager", city: "Berlin", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
melanie = {email: "melanie@web.de", password: "12345678", name: "Melanie Schaufler", age: 55, profession: "Consultant", city: "Berlin", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
luissa = {email: "luissa@web.de", password: "12345678", name: "Luissa Schemuth", age: 24, profession: "Productmanager", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
fabiola = {email: "fabiola@web.de", password: "12345678", name: "Fabian Schweizer", age: 54, profession: "Consultant", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
felipa = {email: "felipa@web.de", password: "12345678", name: "Felipa Lugo", age: 35, profession: "Systemadmin", city: "Hamburg", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
paula = {email: "paula@web.de", password: "12345678", name: "Paula Wittchen", age: 22, profession: "Self-employed", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
petra = {email: "petra@web.de", password: "12345678", name: "Petra Magpentay", age: 24, profession: "Finance Manager", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
donna = {email: "donna@web.de", password: "12345678", name: "Donna Shahini", age: 45, profession: "Driver", city: "Munich", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
maxi = {email: "maxi@web.de", password: "12345678", name: "Maximiliane Mustermann", age: 24, profession: "Consultant", city: "Hamburg", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
celine = {email: "celine@web.de", password: "12345678", name: "Celine Nguyen", age: 34, profession: "Copywriter", city: "Cologne", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
nico = {email: "nico@web.de", password: "12345678", name: "Nicole Mayer", age: 60, profession: "Cook", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}

[louisa, carla, melanie, luissa, fabiola, felipa, paula, petra, donna, maxi, celine, nico].each do |attributes|
user = User.create!(attributes)
puts "Created #{user.email}"
end
puts "Finished"

# puts "Cleaning requests"
# Request.destroy_all
# puts "creating requests"

# louisa = User.where(email: "louisa@web.de" )
# philip = User.where(email: "philip@web.de" )
# carla = User.where(email: "carla@web.de" )
# fabian = User.where(email: "fabian@web.de" )
# felipe = User.where(email: "felipe@web.de" )
# paul = User.where(email: "paul@web.de" )
# peter = User.where(email: "peter@web.de" )
# dion = User.where(email: "dion@web.de" )
# max = User.where(email: "max@web.de" )
# tung = User.where(email: "tung@web.de" )
# nico = User.where(email: "nico@web.de" )

# request1 = {status: "pending", asker: louisa , receiver: nico}
# request2 = {status: "pending", asker: philip, receiver: carla}
# request3 = {status: "pending", asker: dion, receiver: louisa}
# request4 = {status: "pending", asker: max , receiver: tung}


# [request1, request2, request3, request4].each do |attributes|
# user = Request.create!(attributes)
# puts "Created #{request.id}"
# end
