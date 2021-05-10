# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all

city=[]
user=[]
gossip=[]
tag=[]
privatemessage =[]
10.times do |i|
	city << City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	puts "city #{i}"
end
10.times do |i|
  user << User.create!(first_name: Faker::Name.first_name,
  	last_name: Faker::Name.last_name,
  	description: Faker::Lorem.sentences(number: 1),
  	email: Faker::Internet.email,
	age: Faker::Number.within(range: 19..25),
	city_id: city[rand(10)].id
)
 puts "User #{i}"
end
20.times do |i|
	gossip << Gossip.create!(title: Faker::Job.seniority,user_id: user[rand(10)].id, content: Faker::Lorem.sentence)
puts "gossip #{i}"
end
10.times do |i|
	tag << Tag.create!(title: Faker::Job.seniority)
	puts "tag #{i}"
end
10.times do |i|
	GossipTag.create(
        gossip_id: gossip[rand(10)].id,
        tag_id: tag[rand(10)].id
	)
end
 
10.times do |i|
      privatemessage << PrivateMessage.create!(MP: Faker::Movies::HarryPotter.quote,
      sender_id: user[rand(10)].id, 
      recipient_id: user[rand(10)].id)
    puts "MP#{i}"
 end 

