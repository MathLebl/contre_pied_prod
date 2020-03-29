require 'faker'

puts 'Creating an Admin'

user = User.new(
  email: "leblond.mathieu@gmail.com",
  admin: true,
  password: "tototo"
  )
user.save!

puts 'Creating 10 fake SpecArtists...'
10.times do
  artist = Artist.new(
    name:    Faker::Movies::StarWars.character,
    description: Faker::Lorem.paragraph,
    style: Faker::Movies::StarWars.planet,
    category:  "spectacle",
    user_id: 1
  )
  artist.save!
end

puts 'Creating 10 fake ConcertArtists...'
10.times do
  artist = Artist.new(
    name:    Faker::Music.band,
    description: Faker::Lorem.paragraph,
    style: Faker::Music.genre,
    category:  "concert",
    user_id: 1
  )
  artist.save!
end

puts 'Creating 10 fake EnfantArtists...'
10.times do
  artist = Artist.new(
    name:    Faker::Movies::HarryPotter.character,
    description: Faker::Lorem.paragraph,
    style: Faker::Movies::HarryPotter.house,
    category:  "enfant",
    user_id: 1
  )
  artist.save!
end

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
    category:  "spectacle",
    user_id: 1,
    artist_id: Random.rand(1..10)
  )
  event.save!
end


puts 'Finished!'
