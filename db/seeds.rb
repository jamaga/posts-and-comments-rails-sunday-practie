# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
100.times do 
	post = Post.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph)
	5.times do
		post.comments << Comment.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph)
	end
end