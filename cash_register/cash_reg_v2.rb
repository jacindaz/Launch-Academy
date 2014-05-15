#user input - what coffee does the customer want
#case - light, medium, bold options
#amount due = cost of light/m/b coffee
#check - is this enough money?
#if yes, calculate change
#if no, say amount customer owes


def coffee_type_cost

  puts "What kind of coffee would you like? (light, medium, bold)"
  user_coffee = gets.chomp

  case user_coffee
  when "light"
    puts "The user choose light coffee: #{user_coffee}"
    coffee_cost = 5
  when "medium"
    puts "The user choose medium coffee: #{user_coffee}"
    coffee_cost = 7.5
  when "bold"
    puts "The user choose bold coffee: #{user_coffee}"
    coffee_cost = 9.75
  else
    puts "Please choose light, medium, or bold"
  end
  return coffee_cost
end
#puts coffee_type("light")

def coffee
  coffee_cost = coffee_type_cost
  puts "This is the coffee type cost: #{coffee_cost}"

  print "What is the amount tendered? "
  amount_tendered = gets.chomp.to_f

  puts "This is the amount_tendered: #{amount_tendered}, coffee_cost: #{coffee_cost}"
  change = amount_tendered - coffee_cost

  if change < 0
    puts "WARNING: Customer still owes #{change.abs}"
  else
    puts nil
    puts "===Thank You!==="
    puts "The total change due is $#{change}"
    pputs Time.now.strftime("%m/%d/%Y %l:%M %p")
  end #end if statement

end

coffee
