require 'csv'
require 'pry'

#require outside Ruby files in the same directory------------------------------------------------------------
require_relative 'csv_file'
require_relative 'cash_register3'
require_relative 'user_input'



#entire transaction using all other methods----------------------------------------------------------------------------------------
def transaction(file_name)

  prices_array = read_file(file_name)
  #puts prices_array
  array_subtotals_per_item = user_select_name_quantity_array(prices_array)
  #puts "Array with item quantity and subtotal: #{array_subtotals_per_item}"

  puts "Welcome to Jacinda's coffee emporium!"
  puts nil

  #display menu of items
  displayTransactionOptions(prices_array)
  puts nil

  done = false
  while not done
    #user selects item
    user_selection_str = save_input_string("Make a selection: ")

    #break if user selects done
    if user_selection_str == "4"
      done = true
      break
    end

    #user types quantity of item
    quantity = user_quantity

    item_name = user_selection_name(user_selection_str)
    item_hash = return_item_hash(item_name, prices_array)
    item_price = return_item_price(item_name, item_hash).to_f
    #puts "Item name: #{item_name}, Item hash: #{item_hash}, Item price: #{item_price}"


    #calculate and display the subtotal
    subtotal = item_subtotal(item_price, quantity)
    quant_sub_item_hash = array_subtotals_per_item[user_selection_str.to_f - 1]
    new_item_hash = update_subtotal(quant_sub_item_hash, subtotal)
    array_subtotals_per_item[user_selection_str.to_f - 1] = new_item_hash
    #puts "quant_sub_item_hash: #{quant_sub_item_hash}"
    #puts "Array: #{array_subtotals_per_item}"

    #update the quantity in quantity/subtotal array
    updated_quant_hash = update_quantity(new_item_hash, quantity)
    array_subtotals_per_item[user_selection_str.to_f - 1] = new_item_hash

    #binding.pry

    total = total(array_subtotals_per_item)
    formatted_subtotal = formatted_currency(total)
    puts "Subtotal: #{formatted_subtotal}"
    puts nil

  end #end while loop

  puts "===Sale Complete==="
  puts nil

  #displays items purchased
  display_final_transaction(array_subtotals_per_item)
  puts nil
  puts "Total: #{formatted_subtotal}"
  puts nil

  #amount tendered and change calculation
  amount_tendered = save_input_float("What is the amount tendered?" )

  change = (amount_tendered - total)

  if change < 0
    puts "========================"
    puts "WARNING: Customer still owes #{formatted_currency(change.abs)}"
    puts "========================"
  else
    change = sprintf('%.2f', change)
    puts nil
    puts "=======Thank You!======="
    puts "The total change due is $#{change}"
    puts nil
    puts Time.now.strftime("%m/%d/%Y %l:%M %p")
    puts "========================"
  end #end if statement


end
transaction("products.csv")




# def transaction
#   puts "Welcome to Jacinda's coffee emporium!"
#   puts nil
#   displayTransactionOptions
#   puts nil
#   userInput

#   puts "What is the amount tendered?"
#   amount_tendered = gets.chomp.to_f

#   change = (amount_tendered - $global_subtotal)

#   if change < 0
#     puts "========================"
#     puts "WARNING: Customer still owes $#{sprintf('%.2f', change.abs)}"
#     puts "========================"
#   else
#     change = sprintf('%.2f', change)
#     puts nil
#     puts "===Thank You!==="
#     puts "The total change due is $#{change}"
#     puts nil
#     puts Time.now.strftime("%m/%d/%Y %l:%M %p")
#     puts "================"
#   end #end if statement

# end
