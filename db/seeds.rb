# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
matt = User.create(name: 'Matthew Steele', password: 'iproangler', alive: true, born: '1998-02-09')
steele = Family.create(name: 'Steele Family')