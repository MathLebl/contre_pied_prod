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
    c_fees = 0
    if total_weight == 0
      c_fees = 0
    elsif total_weight <= 250
      c_fees = 495
    elsif total_weight <= 500
      c_fees = 645
    elsif total_weight <= 750
      c_fees = 735
    elsif total_weight <= 1000
      c_fees = 799
    elsif total_weight <= 2000
      c_fees = 915
    elsif total_weight <= 5000
      c_fees = 1410
    elsif total_weight <= 10000
      c_fees = 2050
    elsif total_weight <= 15000
      c_fees = 2600
    elsif total_weight <= 30000
      c_fees = 3220
    else
      c_fees = 4000
    end
    fees = Money.new(c_fees)
    fees
  end

  def self.cart_amount(cookie)
    amount = 0
    cookie.each do |item|
      amount += Product.find(item["id"]).price #methode find pour avoir le money object via .price (car non dispo dans le cookie session[:cart])
    end
    amount
  end

  def self.total_amount(cookie)
    amount = cart_amount(cookie)
    fees = cart_fees(cookie)
    total_amount = amount + fees
    total_amount
  end

  def self.reset_cart(cookie)
    cookie.clear
  end
end
