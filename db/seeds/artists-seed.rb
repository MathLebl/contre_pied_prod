require 'faker'

puts 'Creating 10 fake Théatre Artists...'
10.times do
  artist = Artist.new(
    name:    Faker::Movies::StarWars.character,
    description: Faker::Lorem.paragraph,
    style: Faker::Movies::StarWars.planet,
    category:  "Theatre",
    user_id: 1,
    image: "https://images.unsplash.com/photo-1571173069043-82a7a13cee9f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
  )
  artist.save!
end

puts 'Creating 10 fake Concert Artists...'
10.times do
  artist = Artist.new(
    name:    Faker::Music.band,
    description: Faker::Lorem.paragraph,
    style: Faker::Music.genre,
    category:  "Concert",
    user_id: 1,
        image: "https://images.unsplash.com/photo-1529354235303-cc42f23d767a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
  )
  artist.save!
end

puts 'Creating 10 fake Jeune Publique Artists...'
10.times do
  artist = Artist.new(
    name:    Faker::Movies::HarryPotter.character,
    description: Faker::Lorem.paragraph,
    style: Faker::Movies::HarryPotter.house,
    category:  "Jeune Publique",
    user_id: 1,
        image: "https://images.unsplash.com/photo-1472711795975-42c5b4ee828c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
  )
  artist.save!
end

puts "Artists done"


