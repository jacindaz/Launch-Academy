require 'pry'


scores = [75, 100, 85, 65, 84, 87, 95]
scores2 = [98, 32, 75, 60, 54, 88, 100, 27, 81]
all_same = [1,2,3,4,5,6,7]
reverse_sorted = [6,5,4,3,2,1]
one_out_of_order = [5,6,7,8,9,10, 4]
one_out_of_order_reverse = [10,5,6,7,8,9]



def average(array)
  length = array.length
  sum = 0

  array.each do |num|
    sum += num
  end

  average = sum / (length.to_f)
  #puts "Average: #{average}"

  return average
end
#average(scores)


def max(array)
  return array.pop
end


def min(array)
  return array.shift
end

def sort_swap_array(array)
  num1_index = 0
  num2_index = 1

  done = false

  while array[num2_index] != nil
    if array[num1_index] > array[num2_index]
      save_num1 = array[num1_index]
      array[num1_index] = array[num2_index]
      array[num2_index] = save_num1

      save_index1 = num1_index
      save_index2 = num2_index
      while (array[num1_index] < array[num1_index - 1]) && (num1_index > 0)
        #puts "index1: #{num1_index}, index2: #{num2_index}, array: #{array}"
        #puts "inner while, index1: #{num1_index - 1}, index2: #{num1_index}"
        save_num1 = array[num1_index - 1]
        array[num1_index - 1] = array[num1_index]
        array[num1_index] = save_num1
        num1_index -= 1
        num2_index -= 1
      end #end inner while loop
      num1_index = save_index1
      num2_index = save_index2
    end
      #puts "index1: #{num1_index}, index2: #{num2_index}, array: #{array}"
      #puts nil

      num1_index += 1
      num2_index += 1

  end
  #puts "Final sorted array: #{array}"
  return array
end

#sort_swap_array(scores)


def avg_max_min(array)
  sorted_array = sort_swap_array(array)
  puts "For sorted array: #{sorted_array}"

  average = average(array)
  max = max(array)
  min = min(array)


  puts "Average: #{average}, Min: #{min}, Max: #{max}"
end
avg_max_min(reverse_sorted)
