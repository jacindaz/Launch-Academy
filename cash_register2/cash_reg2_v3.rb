def totalSale
  done = false
  array = []
  total_sale = 0

  while not done
    puts "What is the sale price?"
    sale_price = gets.chomp
    if sale_price == "done"
      done = true
      puts nil
      puts "Here are your item prices:"
      puts nil
      array.each {|price| puts "$#{sprintf('%.2f',price)}"}
      puts nil
      puts "The total amount due is $#{sprintf('%.2f',total_sale)}"
      puts "================"
    elsif
      sale_price = sale_price.to_i
      total_sale += sale_price
      puts nil
      puts "Subtotal:  $#{sprintf('%.2f',total_sale)}"
      puts "================"
      array << sale_price.round(2)
      #puts "In elsif statement, price: #{sale_price}, array: #{array}"
    end #end if statement
  end #end while loop
  #puts "Total sale class type: #{total_sale.class}"
  return total_sale
end

def cashRegister
  cost_of_items = totalSale

  puts "What is the amount tendered?"
  amount_tendered = gets.chomp.to_f
  change = (amount_tendered - cost_of_items)

  if change < 0
    puts "WARNING: Customer still owes $#{sprintf('%.2f', change.abs)}"
  else
    change = sprintf('%.2f', change)
    puts nil
    puts "===Thank You!==="
    puts "The total change due is $#{change}"
    puts nil
    puts Time.now.strftime("%m/%d/%Y %l:%M %p")
    puts "================"
  end #end if statement

end

cashRegister

