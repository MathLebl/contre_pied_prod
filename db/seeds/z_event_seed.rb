require 'faker'

puts 'Creating 15 fake Events...'
2.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Lyon",
    artist_id: Artist.first.id,
    location: "Le Théâtre de La Vie qui joue"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Paris",
    artist_id: Artist.last.id,
    location: "Le Théâtre de La Vie qui joue",
    ticket: "https://www.billetreduc.com/th/"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Lyon",
    artist_id: Artist.first.id,
    location: "Le Théâtre de Ta Mère qui Trticotte"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Valence",
    artist_id: Artist.last.id,
    location: "Le Théâtre de Ta Mère qui Trticotte",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Lyon",
    artist_id: Artist.first.id,
    location: "Le Théâtre de La Taupe qui pêche"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Toulouse",
    artist_id: Artist.last.id,
    location: "Le Théâtre de La Taupe qui pêche",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

2.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Le Havre",
    artist_id: Artist.first.id,
    location: "Le Théâtre de La Joie qui danse",
    ticket: "https://www.billetreduc.com/theatre/"
  )
  event.save!
end

3.times do
  event = Event.new(
    date: Faker::Date.forward,
    user_id: User.last.id,
    city: "Marseille",
    artist_id: Artist.last.id,
    location: "Le Théâtre de La Joie qui danse"
  )
  event.save!
end

puts "Events done"
