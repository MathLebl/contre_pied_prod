require 'faker'

puts 'Creating an Admin'

user = User.new(
  email: "leblond.mathieu@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

puts 'Admin done'
