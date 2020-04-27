require 'faker'

puts 'Creating 45 fake Events...'
8.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune publique",
    user_id: 1,
    artist_id: Random.rand(21..30),
    location: "Le Théatre de La Vie qui joue"
  )
  event.save!
end

7.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune publique",
    user_id: 1,
    artist_id: Random.rand(21..30),
    location: "Le Théatre de La Vie qui joue",
    ticket: "https://www.billetreduc.com/spectacles-enfants/"
  )
  event.save!
end

8.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(11..20),
    location: "Le Théatre de La Taupe qui pêche"
  )
  event.save!
end

7.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(11..20),
    location: "Le Théatre de La Taupe qui pêche",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

8.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "theatre",
    user_id: 1,
    artist_id: Random.rand(1..10),
    location: "Le Théatre de La Joie qui danse",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

7.times do
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
