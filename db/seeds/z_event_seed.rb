require 'faker'

puts 'Creating 15 fake Events...'
2.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune_public",
    user_id: 1,
    artist_id: Random.rand(2..9),
    location: "Le Théâtre de La Vie qui joue"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "jeune_public",
    user_id: 1,
    artist_id: Random.rand(2..9),
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
    artist_id: 12,
    location: "Le Théâtre de La Taupe qui pêche"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    category:  "concert",
    user_id: 1,
    artist_id: 10,
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
    artist_id: 11,
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
    artist_id: 9,
    location: "Le Théâtre de La Joie qui danse"
  )
  event.save!
end

puts "Events done"
