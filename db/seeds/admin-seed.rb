require 'faker'

puts 'Creating Admins'

user = User.new(
  name: "Math",
  email: "leblond.mathieu@gmail.com",
  admin: true,
  password: "tototo"
  )
user.skip_confirmation!
user.save!

user = User.new(
  name: "Yéshé",
  email: "h.yeshe@gmail.com",
  admin: true,
  password: "tototo"
  )
user.skip_confirmation!
user.save!

puts 'Admins done'
