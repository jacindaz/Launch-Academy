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

    #binding.pry
    case user_selection_str
    when "1"
      array_subtotals_per_item[0]["quantity"] += quantity
      array_subtotals_per_item[0]["subtotal"] +=
    when "2"
      item_name = prices_array[1]["Name"]
    when "3"
      item_name = prices_array[2]["Name"]
    end #end case statement

    #hash containing name of item, quantity, and subtotal
    #array_subtotals_per_item = user_select_name_quantity_array(prices_array, quantity)


    #binding.pry

    #calculate and display the subtotal
    subtotal = total(array_subtotals_per_item)
    puts "Subtotal: #{formatted_currency(subtotal)}"
    puts nil

  end #end while loop




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
