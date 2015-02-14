# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:"foobar",uid:"123132")
Message.create(body:"sdfsdfsdfsdfsdf Foobar Test landlord", author: "govno")
Filter.create(name: "test", slips: ["piz","dets","test"])
u = User.find_by(username: "foobar")
f = Filter.find_by(name: "test")
m = Message.find_by(author: "govno")
u.filters << f 
u.save
f.messages << m 
f.save
