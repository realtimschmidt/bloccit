# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.create_with(body: "New Body for a New Post").find_or_create_by(title: "New Title for a New Post")
Post.create_with(body: "Another new body.").find_or_create_by(title: "Another new post title")
Post.create_with(body: "So many bodys!").find_or_create_by(title: "So many titles!")
Post.create_with(body: "Just one more body.").find_or_create_by(title: "Just one more title")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
