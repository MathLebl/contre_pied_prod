
puts 'Creating categories...'
cd = ShopCategory.create!(name: 'Album', weight:'80')
tote_bag = ShopCategory.create!(name: 'ToteBag', weight:'90')
briquet = ShopCategory.create!(name: 'Briquet', weight:'80')
carte = ShopCategory.create!(name: 'Carte', weight:'80')
pack_goguette_2 = = ShopCategory.create!(name: 'Pack Goguettes n°2', weight:'380')
pack_goguette_3 = = ShopCategory.create!(name: 'Pack Goguettes n°3', weight:'780')
tshirt = ShopCategory.create!(name: 'Tshirt', weight:'120')

puts 'Creating CD products'
3.times do
  product = Product.new(
    stock: 4,
    name: "Le CD de ouf",
    shop_category_id: ShopCategory.first.id,
    photo_url: "https://images.unsplash.com/photo-1571173069043-82a7a13cee9f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    description: "coucou",
    price_cents: 1400,
    artist_id: Artist.last.id,
    published_at: Time.zone.now
  )
  product.product_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
  product.product_image2.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
  product.save!
end
puts 'Creating Tshirt products'
3.times do
  product = Product.new(
    stock: 8,
    name: "Le Tshirt de ouf",
    shop_category_id: ShopCategory.last.id,
    photo_url: "https://boutique.tennislegend.fr/37-large_default/tshirt-la-chatte-homme.jpg",
    description: "coucou",
    price_cents: 2200,
    artist_id: Artist.last.id,
    published_at: Time.zone.now
  )
  product.product_image.attach(
  io: File.open("app/assets/images/aranjuez/aranjuez-dice3.jpg"),
  filename: "aranjuez-dice3.jpg"
  )
  product.save!
end
puts 'Finished!'
