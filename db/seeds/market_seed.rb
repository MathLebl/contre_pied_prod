puts 'Cleaning database...'
Product.destroy_all
ShopCategory.destroy_all

puts 'Creating categories...'
cd = ShopCategory.create!(name: 'cd')
tshirt = ShopCategory.create!(name: 'Tshirt')

puts 'Creating CD products'
3.times do
  product = Product.new(
    stock: 4,
    name: "Le CD de ouf",
    shop_category_id: 1,
    photo_url: "https://images.unsplash.com/photo-1571173069043-82a7a13cee9f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    price: 14
  )
  product.save!
end
puts 'Creating Tshirt products'
3.times do
  product = Product.new(
    stock: 8,
    name: "Le Tshirt de ouf",
    shop_category_id: 2,
    photo_url: "https://boutique.tennislegend.fr/37-large_default/tshirt-la-chatte-homme.jpg",
    price: 22
  )
  product.save!
end
puts 'Finished!'
