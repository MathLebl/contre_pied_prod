class Cart
  def self.add_to_cart(cookie, id)
    @product = Product.find(id)
    cookie << @product
  end

  def self.remove_from_cart(cookie, id)
    @product = Product.find(id)
    cookie.reject! do |item|
      item["id"] == @product.id
    end
  end

  def self.cart_amount(cookie)
    amount = 0
    cookie.each do |item|
      amount += Product.find(item["id"]).price #methode find pour avoir le money object via .price (car non dispo dans le cookie session[:cart])
    end
    amount
  end
end
