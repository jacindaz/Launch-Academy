require 'csv'
require 'pry'

#require outside Ruby files in the same directory------------------------------------------------------------
 require_relative 'csv_file'
 require_relative 'transaction'
 require_relative 'user_input'
#require 'require_all'

#Dir["/path/to/directory/*.rb"].each {|file| require file }

#Trying to pull from the csv_file.rb file, but getting errors for the following:
#read_file
#prices_array = read_file("products.csv")
#puts read_file("products.csv")


# $light_hash = $prices_array[0]
# $medium_hash = $prices_array[1]
# $bold_hash = $prices_array[2]
# $global_subtotal = 0


def formatted_currency(string)
  return "$#{sprintf("%.2f", string)}"
end
#puts formatted_currency("5")


#displays items to purchase from a CSV------------------------------------------------------------------------------------------------
def displayTransactionOptions(array)
  binding.pry
  num_items = 1

  array.each do |nested_hash|
    puts "#{num_items}) Add item - $#{string(nested_hash["Retail Price"])} - #{nested_hash["Name"]}"
    num_items += 1
  end #end array of hashes each loop
  puts "#{num_items + 1}) Complete Sale"
end
#displayTransactionOptions(prices_array)

def user_selection
  item_selection = save_input_string("Make a selection: ")
  return item_selection
end
#user_selection

def user_selection_name(selection_str)
  case selection_str
  when "1"
    return "Light"
  when "2"
    return "Medium"
  when "3"
    return "Bold"
  when "4"
    return "Done"
  end
end
#puts user_selection_name("1")

def user_quantity
  item_quantity = save_input_float("How many? ")
  return item_quantity
end

#returns the subtotal
def item_subtotal(float_price, quantity)
  return (float_price * quantity)
end

def user_selection_quant_subtotal_block
  user_selection
  if user_selection != 4
      user_quantity
  end
end


#select, quantity, subtotal------------------------------------------------------------------------------------------------
#returns hash with name, quantity, and subtotal for each coffee
def user_input
  light_quantity = { "quantity" => 0, "subtotal" => 1}
  medium_quantity = { "quantity" => 0, "subtotal" => 1}
  bold_quantity = { "quantity" => 0, "subtotal" => 1}
  subtotal = 0

  done = false

  while not done
    user_selection

    if user_selection == 4
      break
    end

    user_quantity

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





























