require 'faker'

puts 'Creating 45 fake Events...'
15.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "enfant",
    user_id: 1,
    artist_id: Random.rand(21..30),
    location: "Le Théatre de La Vie quie joue"
  )
  event.save!
end

15.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(11..20),
    location: "Le Théatre de La Taupe qui pêche"
  )
  event.save!
end

15.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "theatre",
    user_id: 1,
    artist_id: Random.rand(1..10),
    location: "Le Théatre de La Joie qui danse"
  )
  event.save!
end

puts "Events done"
