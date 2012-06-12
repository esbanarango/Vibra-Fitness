# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seat = Seat.create!( name: "Mall Drive Inn Campestre", address:"L.103", phone: "4445576", num_machines: 8)
Seat.create!( name: "Mall Interplaza", address:"L.295", phone: "4445576", num_machines: 3)
Seat.create!( name: "Laureles", address:"Cr 76 #34A-61", phone: "4445576", num_machines: 6)

Employee.create!( first_name: "admin", last_name:"admin", document:"admin", address:"", phone:"7777777", mobile:"7777777", email: "admin@admin.com", password: "adminadmin", password_confirmation: "adminadmin", seat_id:seat.id)

99.times do |n|
  first_name  		= Faker::Name.first_name
  last_name   		= Faker::Name.last_name
  gender			= (n%2) ? "Masculino" : "Femenino"
  document    		= 11111111+n
  email 	  		= "example-#{n+1}@vibrafitness.com"
  password    		= "password"
  address			= Faker::Address.city + " " + Faker::Address.street_name + " " + Faker::Address.zip_code
  phone       		= Faker::PhoneNumber.phone_number
  mobile      		= Faker::PhoneNumber.phone_number
  company 			= Faker::Company.name
  position			= Faker::Lorem.words
  phone_company  	= Faker::PhoneNumber.phone_number


  Client.create!(
  			   first_name: first_name,
  			   last_name: last_name,
  			   gender: gender,
           email: email,
           document: document,
           phone: phone,
           address: address,
           mobile: mobile,
           company: company,
           position: position,
           phone_company:phone_company,
           password: password,
           password_confirmation: password,
           seat_id:seat.id)
end