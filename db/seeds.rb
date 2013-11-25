# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Player.delete_all
Player.create(name: 'admin', 
              password: 'admin',
              password_confirmation: 'admin',
              role: 'admin')
Player.create(name: 'player1', 
              password: '1',
              password_confirmation: '1',
              role: 'user')
Player.create(name: 'player2', 
              password: '2',
              password_confirmation: '2',
              role: 'user')
Player.create(name: 'player3', 
              password: '3',
              password_confirmation: '3',
              role: 'user')
Player.create(name: 'player4', 
              password: '4',
              password_confirmation: '4',
              role: 'user')
Player.create(name: 'player5', 
              password: '5',
              password_confirmation: '5',
              role: 'user')
Player.create(name: 'player6', 
              password: '6',
              password_confirmation: '6',
              role: 'user')
Player.create(name: 'player7', 
              password: '7',
              password_confirmation: '7',
              role: 'user')
Player.create(name: 'player8', 
              password: '8',
              password_confirmation: '8',
              role: 'user')
Player.create(name: 'player9', 
              password: '9',
              password_confirmation: '9',
              role: 'user')
Player.create(name: 'player10', 
              password: '10',
              password_confirmation: '10',
              role: 'user')
Player.create(name: 'player11', 
              password: '11',
              password_confirmation: '11',
              role: 'user')
Player.create(name: 'player12', 
              password: '12',
              password_confirmation: '12',
              role: 'user')
              
Training.delete_all
Participation.delete_all
