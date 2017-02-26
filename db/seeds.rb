10.times do
  User.create!({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: 'password'})
end

15.times do
  Post.create!({title: Faker::Lorem.sentence, content: Faker::Lorem.sentences, author_id: Faker::Number.between(1, 10)})
end

15.times do
  Comment.create!({body: Faker::Lorem.sentences, commenter_id: Faker::Number.between(1, 10), post_id: Faker::Number.between(1, 15)})
end
