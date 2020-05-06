require 'faker'

puts 'Creating 15 fake Events...'
2.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune public",
    user_id: 1,
    artist_id: Random.rand(9..12),
    location: "Le Théâtre de La Vie qui joue"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune public",
    user_id: 1,
    artist_id: Random.rand(9..12),
    location: "Le Théâtre de La Vie qui joue",
    ticket: "https://www.billetreduc.com/spectacles-enfants/"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(5..8),
    location: "Le Théâtre de La Taupe qui pêche"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: Random.rand(5..8),
    location: "Le Théâtre de La Taupe qui pêche",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "spectacle",
    user_id: 1,
    artist_id: Random.rand(1..4),
    location: "Le Théâtre de La Joie qui danse",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "spectacle",
    user_id: 1,
    artist_id: Random.rand(1..4),
    location: "Le Théâtre de La Joie qui danse"
  )
  event.save!
end

puts "Events done"
