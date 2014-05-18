require 'pry'
scores = [75, 100, 85, 65, 84, 87, 95]


def return_last_element(array)
  if (array.length % 2) != 0
    return array.last
  end
end

def pop_last_element(array)
  array.pop
  return array
end
#puts pop_last_element(scores)

def add_last_element(last_element, array)
  if last_element != nil
    array.push(last_element)
  end
end

def compare_elements(array)
  new_array = []
  first_index = 0
  second_index = 1
  last_element = nil

  last_element = return_last_element(array)
  if last_element != nil
    pop_last_element(array)
    #puts "I am popping last element from array: #{array}"
  end

  array.each do |num|
    #puts "num: #{num}, Original array: #{array}"
    if array[first_index] == nil
      #puts "Array.last: #{array.last}"
      break
    elsif array[first_index] > array[second_index]
      new_array[first_index] = array[second_index]
      new_array[second_index] = array[first_index]
    elsif array[first_index] < array[second_index]
      new_array[first_index] = array[first_index]
      new_array[second_index] = array[second_index]
    end #end if statement
    first_index += 2
    second_index += 2
    #puts "index1: #{first_index}, index2: #{second_index}, array: #{new_array}"
    #puts nil
  end #end each loop

  if last_element != nil
    #puts "I'm adding last element back: #{last_element}"
    add_last_element(last_element, new_array)
  end

  puts "Final array: #{new_array}"
  return new_array

end




def swap_num(array)
  num_placeholder = array[0]
  if array[0] > array[1]
    array[0] = array[1]
    array[1] = num_placeholder
  end
  return array
end
# puts "#{swap_num([23, 20])}"

def split_arrays(array)
  length = array.length
  mid_index = length/2
  last_index = array.index(array.last)

  array1 = array.slice(0, length/2)
  array2 = array.slice(mid_index, last_index)
  #puts "array1: #{array1}, mid: #{mid_index}, array2: #{array2}"
  final_array = [array1, array2]
  puts "Final array of arrays: #{final_array}"
  return final_array
end
#split_arrays([1,2,3,4,5])
#split_arrays([1,2,3,4,5,6])

def compare_1st_element(array_of_arrays)
  array1 = array_of_arrays[0]
  array2 = array_of_arrays[1]
end
#compare_1st_element()

def sort_swap_array(array)
  array.each do |num|
    puts "Array: #{array}"
    num1_index = array.index(num)
    num2_index = num1_index + 1
    if array[num1_index] > array[num2_index]
      puts "num1: #{array[num1_index]}, num2: #{array[num2_index]}"
      temp_num_holder = num
      array[num1_index] = array[num2_index]
      array[num2_index] = num
    end
    puts "Swapped array: #{array}"
    puts nil
  end #end each loop
end
#sort_swap_array(scores)


def merge_sort(array)
  sorted_array = array
  return sorted_array
end
