class Product
  attr_accessor(:name, :price, :quantity, :sales_tax, :import)
  def initialize(name, price, quantity, import=false)
    @name = name
    @price = price * 100
    @quantity = quantity
  end

  def sales_tax
    @price * 0.1
  end

  def import_fee
    if @import == true
      @price * 0.5
    end
  end


  # attr_accessor writes these two methods for you
  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end
end

class ExemptProduct < Product
  def sales_tax
    0
  end
end

class Import < Product
  def sales_tax
    (@price * 0.15)
  end
end

class ImportedExempt < ExemptProduct
  def sales_tax
    @price * 0.05
  end
end

def calculate(*products)
  total = 0
  total_tax = 0
  products.each {|x| 
    puts "#{x.quantity} #{x.name} : #{((x.price + x.sales_tax)/100).round(2)}"
    total_tax += x.sales_tax
    total += x.price
  }
  puts "Sales Taxes: #{(total_tax / 100).round(2)}"
  puts "Total: #{((total + total_tax)/100).round(2)}"
end



book = ExemptProduct.new("Book", 12.49, 1)
cd = Product.new("Music CD", 14.99, 1)
chocolate = ExemptProduct.new("Chocolate Bar", 0.85, 1)

chocbox = ImportedExempt.new("Imported Box of Chocolates", 10.00, 1)
perfume = Import.new("Imported Bottle of Perfume", 47.50, 1)

imported_perfume = Import.new("Imported bottle of perfume", 27.99, 1)
domestic_perfume = Product.new("Bottle of perfume", 18.99, 1)
pills = ExemptProduct.new("Packet of headache pills", 9.75, 1)
box_chocolates = ImportedExempt.new("Box of imported chocolates", 11.25, 1)

calculate(book, cd, chocolate)
puts "--------------------"
calculate(chocbox, perfume)
puts "--------------------"
calculate(imported_perfume, domestic_perfume, pills, box_chocolates)



