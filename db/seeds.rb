# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

User.create :email => "erikikoo@hotmail.com", :password => "HayHelena"
User.create :email => "seudesigner@outlook.com.br", :password => "123456"
#User.create :email => "paulinhapooh08", :password => "083126"
# 60.times do |f|
# 	Segmento.create! :descricao => FFaker::Job
# end