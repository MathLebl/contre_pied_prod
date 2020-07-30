require 'faker'

puts 'Cleaning database...'
User.destroy_all
Artist.destroy_all

puts 'Creating Admins'

user = User.new(
  name: "Math",
  email: "leblond.mathieu@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

user = User.new(
  name: "Yéshé",
  email: "h.yeshe@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

puts 'Admins done'
