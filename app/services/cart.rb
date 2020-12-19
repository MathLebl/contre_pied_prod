class Cart
  def self.add_to_cart(cookie, id, quantity, size, size2)
    @product = Product.find(id)
    @quantity = quantity
    if size2.nil?
      @size = size
    else
      @size = size, size2
    end
    cart_element = { product_id: @product.id, size: @size, quantity: @quantity}

    cookie << cart_element
  end

  def self.remove_from_cart(cookie, id)
    @product = Product.find(id)
    b = cookie.find {|item| item.class == Hash ? item["product_id"] == @product.id : item == @product.id}
    a= cookie.find_index(b)
    cookie.delete_at(a)
  end

  # def self.change_from_cart(cookie, id)
  #   @product = Product.find(id)
  #   b = cookie.find {|item| item["product_id"] == @product.id }
  #   @quantity = b["quantity"]
  #   @size = b["size"]

  # end

  def self.cart_count(cookie)
      cart_count = 0
      cart_count = cookie.map {|s| s.class == Hash ? s['quantity'].to_i : 1 }.reduce(0, :+)

  end

  def self.cart_weight(cookie)
    total_weight = 0
    cookie.each do |item|
      total_weight += item.class == Hash ? Product.find(item["product_id"]).shop_category.weight * item["quantity"].to_i : Product.find(item).shop_category.weight
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
      amount += item.class == Hash ? Product.find(item["product_id"]).price * item["quantity"].to_i : Product.find(item).price
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
