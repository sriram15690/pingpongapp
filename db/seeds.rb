# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 User.create(name: 'Sriram', email: "sriram1@gmail.com", password: "12345678")
 Table.create(number: 1)
 Booking.create(user_id: User.first.id, table_id: Table.first.id, start_time: Time.now,end_time: (Time.now + 30.minutes) )
