require 'csv'


#read_file reads a CSV file, returns has with SKU, item name, and retail price ($$)----------------------------------------------------
def read_file(file_name)
  name_prices_array = []
  CSV.foreach("products.csv", headers: true) do |row|
    row_hash = { "Name" => row["name"], "SKU" => row["SKU"], "Retail Price" => row["retail_price"].to_f}
    name_prices_array << row_hash
  end
  #puts "Array: #{name_prices_array}"
  return name_prices_array
end
#read_file
$prices_array = read_file("products.csv")


#displays items to purchase from a CSV------------------------------------------------------------------------------------------------
def displayTransactionOptions
  num_items = 1

  $prices_array.each do |nested_hash|
    puts "#{num_items}) Add item - $#{sprintf("%.2f", nested_hash["Retail Price"])} - #{nested_hash["Name"]}"
    num_items += 1
  end #end array of hashes each loop
  puts "4) Complete Sale"
end
#displayTransactionOptions



#select, quantity, subtotal------------------------------------------------------------------------------------------------
def userInput
  puts "Prices array: #{$prices_array}"

  puts "Make a selection: "
  user_selection = gets.chomp.to_i
  puts "How many? "
  user_quantity = gets.chomp.to_i

  #return the appropriate price based on the name of the coffee selected (by user)
  case user_selection
  when "1"
    price = prices_hash
  when "2"
  when "3"
  when "4"
    return ______
  end

  subtotal = user_selection * user_quantity * price
  puts "Selection: #{user_selection}, Quantity: #{user_quantity}, Subtotal: #{subtotal}"

end
#userInput



#entire transaction using all other methods----------------------------------------------------------------------------------------
def transaction
  puts "Welcome to Jacinda's coffee emporium!"
  puts nil
  displayTransactionOptions
  puts nil



end
#transaction

