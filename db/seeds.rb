puts "Cleaning users"
User.destroy_all
puts "creating users"

louisa = {email: "louisa@web.de", password: "12345678", name: "Louisa Scheiter", age: 24, profession: "Consultant", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
carla = {email: "carla@web.de", password: "12345678", name: "Carla Schell", age: 24, profession: "Manager", city: "Berlin", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
philip = {email: "philipp@web.de", password: "12345678", name: "Philipp Moeller", age: 24, profession: "Consultant", city: "Berlin", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
luissa = {email: "luissa@web.de", password: "12345678", name: "Luissa Schemuth", age: 24, profession: "Productmanager", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
fabian = {email: "fabian@web.de", password: "12345678", name: "Fabian Schweizer", age: 24, profession: "Consultant", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
felipe = {email: "felipe@web.de", password: "12345678", name: "Felipe Lugo", age: 24, profession: "Systemadmin", city: "Hamburg", answer1: "sd", answer2: "sd", answer3: "sd", mentor: true}
paul = {email: "paul@web.de", password: "12345678", name: "Paul Wittchen", age: 24, profession: "Self-employed", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
peter = {email: "peter@web.de", password: "12345678", name: "Peter Magpentay", age: 24, profession: "Finance Manager", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
dion = {email: "dion@web.de", password: "12345678", name: "Dion Shahini", age: 24, profession: "Driver", city: "Munich", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
max = {email: "max@web.de", password: "12345678", name: "Max Mustermann", age: 24, profession: "Consultant", city: "Hamburg", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
tung = {email: "tung@web.de", password: "12345678", name: "Tung Nguyen", age: 24, profession: "Copywriter", city: "Cologne", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}
nico = {email: "nico@web.de", password: "12345678", name: "Nicolo Grazie", age: 24, profession: "Cook", city: "Dusseldorf", answer1: "sd", answer2: "sd", answer3: "sd", mentor: false}

[louisa, carla, philip, luissa, fabian, felipe, paul, peter, dion, max, tung, nico].each do |attributes|
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
puts "Finished"
