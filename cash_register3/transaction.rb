require 'csv'

#require outside Ruby files in the same directory------------------------------------------------------------
require_relative 'csv_file'
require_relative 'cash_register3'

#entire transaction using all other methods----------------------------------------------------------------------------------------
def transaction
  puts "Welcome to Jacinda's coffee emporium!"
  puts nil
  displayTransactionOptions
  puts nil
  userInput

  puts "What is the amount tendered?"
  amount_tendered = gets.chomp.to_f

  change = (amount_tendered - $global_subtotal)

  if change < 0
    puts "========================"
    puts "WARNING: Customer still owes $#{sprintf('%.2f', change.abs)}"
    puts "========================"
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
#transaction
