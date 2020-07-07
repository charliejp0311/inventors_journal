# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{name:"Cj",email:"cj@test.com",password:"cj"},{name:"Al",email:"al@test.com",password:"al"},{name:"tris",email:"tris@test.com",password:"tris"}])
categories = Category.create([{category: "apps"},{category: "electrical"},{category: "fire"},{category: "sustainability"},{category: "metal forging"},{category: "cooking"}])