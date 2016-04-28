# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:'Rails Admin',email: 'a@z.com',password:'admin123',password_confirmation:'admin123',admin:true)
Type.create(name:'Fire',power:5)
Type.create(name:'Water',power:4)
Type.create(name:'Earth',power:3)
Type.create(name:'Electric',power:2)
Type.create(name:'Wind',power:1)

