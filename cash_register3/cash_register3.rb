require 'csv'

#require outside Ruby files in the same directory------------------------------------------------------------
require_relative 'csv_file'
require_relative 'transaction'

#read_file
$prices_array = read_file("products.csv")


$light_hash = $prices_array[0]
$medium_hash = $prices_array[1]
$bold_hash = $prices_array[2]
$global_subtotal = 0

$light_quantity_global = {}
$medium_quantity_global = {}
$bold_quantity_global = {}


#displays items to purchase from a CSV------------------------------------------------------------------------------------------------
def displayTransactionOptions
  num_items = 1

  $prices_array.each do |nested_hash|
    puts "#{num_items}) Add item - $#{sprintf("%.2f", nested_hash["Retail Price"])} - #{nested_hash["Name"]}"
    num_items += 1
  end #end array of hashes each loop
  puts "#{num_items + 1}) Complete Sale"
end
#displayTransactionOptions




#select, quantity, subtotal------------------------------------------------------------------------------------------------
#returns hash with name, quantity, and subtotal for each coffee
def userInput
  light_quantity = { "quantity" => 0, "subtotal" => 1}
  medium_quantity = { "quantity" => 0, "subtotal" => 1}
  bold_quantity = { "quantity" => 0, "subtotal" => 1}
  subtotal = 0
  done = false

  while not done
    puts "Make a selection: "
    user_selection = gets.chomp.to_i

    if user_selection == 4
      break
    end

    puts "How many? "
    user_quantity = gets.chomp.to_i

    #return the appropriate price based on the name of the coffee selected (by user)
    case user_selection
    when 1
      price = $light_hash["Retail Price"]
      light_quantity["quantity"] += user_quantity
      light_quantity["subtotal"] += $light_hash["Retail Price"]
      #light_quantity["quantity"] += user_quantity
      #light_quantity["subtotal"] += $light_hash["Retail Price"]
    when 2
      price = $medium_hash["Retail Price"]
      medium_quantity["quantity"] += user_quantity
      medium_quantity["subtotal"] += $medium_hash["Retail Price"]
    when 3
      price = $bold_hash["Retail Price"]
      bold_quantity["quantity"] += user_quantity
      bold_quantity["subtotal"] += $bold_hash["Retail Price"]
    end

    subtotal += (user_quantity * price)
    #puts "Selection: #{user_selection}, Quantity: #{user_quantity}, Subtotal: #{subtotal}"
    puts "Subtotal: $#{sprintf("%.2f", subtotal)}"
    puts nil
  end #end while loop, only when user selection is 4

  puts "===Sale Complete==="
  puts nil

  if light_quantity["quantity"] != 0
    puts "$#{sprintf("%.2f", light_quantity["subtotal"])} - #{light_quantity["quantity"]} Light"
  end
  if medium_quantity["quantity"] != 0
    puts "$#{sprintf("%.2f", medium_quantity["subtotal"])} - #{medium_quantity["quantity"]} Medium"
  end
  if bold_quantity["quantity"] != 0
    puts "$#{sprintf("%.2f", bold_quantity["subtotal"])} - #{bold_quantity["quantity"]} Bold"
  end

  $global_subtotal = subtotal
  $light_quantity_global = light_quantity
  $medium_quantity_global = medium_quantity
  $bold_quantity_global = bold_quantity

  puts nil
  puts "Total: $#{subtotal}"
  puts nil

end
#userInput





























