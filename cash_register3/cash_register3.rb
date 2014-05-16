require 'pry'


def user_select_name_quantity_array(item_name, items_array_of_hashes, quantity)
  item_hash = return_item_hash(item_name, items_array_of_hashes)
  item_price = return_item_price(item_name, item_hash)

  subtotal = item_subtotal(item_price, quantity)
  return {"name" => item_name, "quantity" => quantity, "subtotal" => subtotal }
end
#user_select_name_quantity_array("Light", prices_array, 2)

def return_item_price(item_name, item_hash)
  item_price = item_hash["Retail Price"]
  return item_price
end

def return_item_hash(item_name, array_of_hashes)
  case item_name
  when "Light"
    return array_of_hashes[0]
  when "Medium"
    return array_of_hashes[1]
  when "Bold"
    return array_of_hashes[2]
  end
end


def formatted_currency(string)
  return "$#{sprintf("%.2f", string)}"
end
#puts formatted_currency("5")


#displays items to purchase from a CSV------------------------------------------------------------------------------------------------
def displayTransactionOptions(array)
  num_items = 1

  array.each do |nested_hash|
    puts "#{num_items}) Add item - #{formatted_currency(nested_hash["Retail Price"])} - #{nested_hash["Name"]}"
    num_items += 1
  end #end array of hashes each loop
  puts "#{num_items}) Complete Sale"
end
#displayTransactionOptions([{"Name"=>"Light", "SKU"=>"120945", "Retail Price"=>5.0},{"Name"=>"Medium", "SKU"=>"679340", "Retail Price"=>7.5},{"Name"=>"Bold", "SKU"=>"328745", "Retail Price"=>9.75}])


#returns the subtotal
def item_subtotal(float_price, quantity)
  float_price = float_price.to_f
  quantity = quantity.to_f
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





























