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

# post id: 51
post_var = Post.find_or_create_by!(title: "New Title for a New Post", body: "New Body for a New Post")

# comment id: 101 with post id:51
Comment.find_or_create_by!(post: post_var, body: "This is a unique comment body and it differs from the related post body")


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
