# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seat = Seat.create!( name: "Principal", address:"Cr 28 sur #20-14", phone: "3181420", num_machines: 5)
Employee.create!( first_name: "admin", last_name:"admin", document:"admin", address:"", phone:"7777777", mobile:"7777777", email: "admin@admin.com", password: "adminadmin", password_confirmation: "adminadmin", seat_id:seat.id)