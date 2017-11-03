require 'faker'

admin = User.create(username: "admin", password: "admin")
puts "Created #{admin}"

5.times do
  user = Faker::Name.unique.first_name

  User.create(username: user, password: "1234")
  puts "Created #{user}"
end

10.times do
  name = Faker::Beer.unique.name
  cost = [10, 15, 20, 25, 30, 35, 40, 45, 50].sample

  Reward.create(name: name, cost: cost)
  puts "Created #{name}"
end