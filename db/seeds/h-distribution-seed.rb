puts "Creating Distributions"

3.times do
  distribution = Distribution.new(
    name: "Test distrib",
    artist_id: Artist.last.id
  )
  distribution.save!
end

3.times do
  distribution = Distribution.new(
    name: "Test distrib",
    artist_id: Artist.first.id
  )
  distribution.save!
end

puts "Distributions done"
