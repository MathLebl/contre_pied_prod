require 'faker'

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

puts "Artists done"
