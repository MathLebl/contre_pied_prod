require 'faker'

puts 'Creating Admins'

user = User.new(
  email: "leblond.mathieu@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

user = User.new(
  email: "h.yeshe@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

puts 'Admins done'
