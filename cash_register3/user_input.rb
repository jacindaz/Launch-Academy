require 'csv'
require 'pry'

#require outside Ruby files in the same directory------------------------------------------------------------
require_relative 'csv_file'
require_relative 'cash_register3'
require_relative 'transaction'


def save_input_string(string_prompt)
  print "#{string_prompt} "
  return gets.chomp
end
#user_input("Test string")


def save_input_float(string_prompt)
  print "#{string_prompt} "
  return gets.chomp.to_f
end

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
