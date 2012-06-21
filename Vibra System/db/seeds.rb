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

Plan.create!( name: "Rebajar", start_time:"06:00", end_time: "21:00", plan_type:"Diario", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", max_age: 45, min_age: 13)
plan = Plan.create!( name: "Fortalecimiento", start_time:"07:00", end_time: "20:30", plan_type:"Sesiones", description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", max_age: 50, min_age: 14)

product = Product.create!(num_sessions:15, price:80000, cash_price:76000, expiration:25, num_pqt_fidelity:20, discount_pct:7, plan_id: plan.id)



200.times do |n|
  first_name  		= Faker::Name.first_name
  last_name   		= Faker::Name.last_name
  gender			= (n%3 == 0) ? "Masculino" : "Femenino"
  document    		= 11111111+n
  email 	  		= "#{n+1}@vibrafitness.com"
  password    		= "password"
  address			= Faker::Address.city + " " + Faker::Address.street_name + " " + Faker::Address.zip_code
  phone       		= Faker::PhoneNumber.phone_number
  mobile      		= Faker::PhoneNumber.phone_number
  company 			= Faker::Company.name
  position			= Faker::Lorem.words
  phone_company  	= Faker::PhoneNumber.phone_number



  client = Client.create!(
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


  HistoryPlan.create!(num_sessions:15, last_session_date: "2012-06-19 04:10:22", expiration_date: "2012-07-10", state: (n%2 == 0) ? "Activo" : "Vencido", client_id: client.id, product_id: product.id)
  HistoryPlan.create!(num_sessions:15, last_session_date: "2012-02-19 14:40:33", expiration_date: "2012-03-10", state: "Vencido", client_id: client.id, product_id: product.id)
  HistoryPlan.create!(num_sessions:15, last_session_date: "2012-01-19 13:30:40", expiration_date: "2012-02-10", state: "Vencido", client_id: client.id, product_id: product.id)
  HistoryPlan.create!(num_sessions:15, last_session_date: "2012-04-19 09:50:60", expiration_date: "2012-05-10", state: "Vencido", client_id: client.id, product_id: product.id)


end



