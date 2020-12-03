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

  def self.cart_weight(cookie)
    total_weight = 0
    cookie.each do |item|
      total_weight += Product.find(item["id"]).shop_category.weight
    end
    total_weight
  end

  def self.cart_fees(cookie)
    total_weight = cart_weight(cookie)
    fees = 0
    if total_weight == 0
      fees = 0
    elsif total_weight <= 200
      fees = 2
    elsif total_weight <= 500
      fees = 4
    elsif total_weight <= 1000
      fees = 6
    elsif total_weight < 2000
      fees = 7
    else
      fees = 8
    end
    fees
  end

  def self.cart_amount(cookie)
    amount = 0
    cookie.each do |item|
      amount += Product.find(item["id"]).price #methode find pour avoir le money object via .price (car non dispo dans le cookie session[:cart])
    end
    amount
  end


  def self.reset_cart(cookie)
    cookie.clear
  end
end
