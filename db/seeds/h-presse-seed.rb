puts "Creating Presses"

3.times do
  presse = Presse.new(
    name: "Test Presse",
    artist_id: Artist.last.id
  )
  presse.save!
end

3.times do
  presse = Presse.new(
    name: "Test Presse",
    artist_id: Artist.first.id
  )
  presse.save!
end

puts "Presses done"
