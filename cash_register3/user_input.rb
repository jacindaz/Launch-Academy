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
