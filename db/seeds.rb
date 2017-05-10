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
Post.find_or_create_by!(title: "New Title for a New Post", body: "New Body for a New Post")
# post id: 52
Post.find_or_create_by!(title: "Another new post title", body: "Another new body.")
Post.find_or_create_by!(title: "So many titles!", body: "So many bodys!")
Post.find_or_create_by!(title: "Just one more title", body: "Just one more body.")

# comment id: 101 with post id:51
Comment.find_or_create_by!(post: Post.find_or_create_by!(title: "New Title for a New Post", body: "New Body for a New Post"), body: "This is a unique comment body and it differs from the related post body")

# comment id:102 with brand new post
Comment.find_or_create_by!(post: Post.find_or_create_by!(title: "Post from a comment", body: "This post didn't exist before this comment was created"), body: "A very unique comment for a very unique post")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
