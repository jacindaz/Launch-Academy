require 'pry'


#returns an array of hashes with quantity=0 (default if none specified),
#name of the item, and subtotal(default=0), using a given hash
def user_select_name_quantity_array(array_of_hashes, quantity=0, subtotal=0)
  array_quantity_subtotal = []
  array_of_hashes.each do |nested_hash|
    new_hash = { "name" =>  nested_hash["Name"], "quantity" => quantity, "subtotal" => subtotal}
    array_quantity_subtotal << new_hash
  end #end each loop of nested hashes
  return array_quantity_subtotal
end

#returns the subtotal per item
def item_subtotal(float_price, quantity)
  float_price = float_price.to_f
  quantity = quantity.to_f
  return (float_price * quantity)
end

#returns the total (if user is "Done"), or the subtotal if user still inputting
def total(array_of_hashes)
  total = 0
  array_of_hashes.each do |nested_hash|
    subtotal = nested_hash["subtotal"].to_f
    total += subtotal
  end #end of each looping over nested hashes
  return total
end
#puts total([{"name" => "item_name", "quantity" => "quantity", "subtotal" => 10}, {"name" => "item_name", "quantity" => "quantity", "subtotal" => 15.0}])
# => returns 25.0

#update the subtotal in a given hash, and return the hash w/ new subtotal
def update_subtotal(item_hash, subtotal_to_add)
  item_hash["subtotal"] += subtotal_to_add
  return item_hash
end


#update the quantity in a given hash, and return the hash w/ new quantity
def update_quantity(item_hash, quantity_to_add)
  item_hash["quantity"] += quantity_to_add
  return item_hash
end



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


def formatted_currency(string_or_float)
  if string_or_float.class == Fixnum
    string_or_float = string_or_float.to_s
  end
  return "$#{sprintf("%.2f", string_or_float)}"
end
#puts formatted_currency(5)
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

def display_final_transaction(array)
  array.each do |nested_hash|
    puts "#{formatted_currency(nested_hash["subtotal"])} - #{nested_hash["quantity"]} #{nested_hash["name"]}"
  end #end array of hashes each loop
end


#OLD METHODS - DO NOT USE --------------------------------------------------------

#returns an array of hashes, containing the item quantity and subtotal
# def user_select_name_quantity_array(item_name, items_array_of_hashes, quantity=0)
#   array_of_subtotals = []

#   item_hash = return_item_hash(item_name, items_array_of_hashes)
#   item_price = return_item_price(item_name, item_hash)

#   subtotal = item_subtotal(item_price, quantity)
#   hash_quantity_subtotal = {"name" => item_name, "quantity" => quantity, "subtotal" => subtotal }
#   array_of_subtotals << hash_quantity_subtotal
#   return array_of_subtotals
# end
#user_select_name_quantity_array("Light", prices_array, 2)
