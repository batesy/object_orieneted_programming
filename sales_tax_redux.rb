class Product
  attr_accessor(:quantity, :name, :price, :tax_rate)
  def initialize(quantity, name, price)
    @name = name
    @price = price
    @quantity = quantity
    @tax_rate = 0.1
  end

  def sales_tax
    price * tax_rate
  end
end

class Exempt < Product
  def tax_rate
    0
  end
end

class Import < Product
  def tax_rate
    super + 0.05
  end
end


book = Import.new(1, "Book", 12.49)

puts book.name
puts book.price
puts book.quantity
puts book.tax_rate
puts book.sales_tax

