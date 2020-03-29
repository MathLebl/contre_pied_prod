require 'faker'

puts 'Creating 12 fake Events...'
4.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "enfant",
    user_id: 1,
    artist_id: Random.rand(21..30)
  )
  event.save!
end

4.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(11..20)
  )
  event.save!
end

4.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "theatre",
    user_id: 1,
    artist_id: Random.rand(1..10)
  )
  event.save!
end

puts "Events done"
