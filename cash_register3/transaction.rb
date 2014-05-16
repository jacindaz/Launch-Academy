require 'csv'
require 'pry'

#require outside Ruby files in the same directory------------------------------------------------------------
require_relative 'csv_file'
require_relative 'cash_register3'
require_relative 'user_input'



#entire transaction using all other methods----------------------------------------------------------------------------------------
def transaction(file_name)
  #binding.pry
  prices_array = read_file(file_name)
  #puts prices_array

  puts "Welcome to Jacinda's coffee emporium!"
  puts nil

  #display menu of items
  displayTransactionOptions(prices_array)
  puts nil

  done = false
  while not done
    #binding.pry
    #user selects item
    user_selection_str = user_selection_name(user_selection)

    #break if user selects done
    if user_selection_str == "Done"
      done = true
      break
    end
    #binding.pry
    case user_selection_str
    when "Light"
      quantity = user_quantity
      item_name = prices_array[0]["Name"]
    when "Medium"
      quantity = user_quantity
      item_name = prices_array[1]["Name"]
    when "Bold"
      quantity = user_quantity
      item_name = prices_array[2]["Name"]
    end #end case statement
  end #end while loop

  #hash containing name of item, quantity, and subtotal
  some_hash = user_select_name_quantity_array(item_name, prices_array, quantity)
  puts "Item quantity and subtotal: #{some_hash}"


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
