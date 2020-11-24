puts "Creating Credits"

3.times do
  credit = Credit.new(
    name: "Test Crédit",
    artist_id: Artist.last.id
  )
  credit.save!
end

3.times do
  credit = Credit.new(
    name: "Test Crédit",
    artist_id: Artist.first.id
  )
  credit.save!
end

puts "Credits done"
