puts "Creating Partenaires"

3.times do
  partenaire = Partenaire.new(
    name: "Test Partenaire",
    artist_id: Artist.last.id
  )
  partenaire.save!
end

3.times do
  partenaire = Partenaire.new(
    name: "Test Partenaire",
    artist_id: Artist.first.id
  )
  partenaire.save!
end

puts "Partenaires done"
