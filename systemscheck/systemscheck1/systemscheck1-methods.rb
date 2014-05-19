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
    return array.push(last_element)
  end
end

def nest_last_array(array1, array2)
  array_of_arrays = [array1, array2]
  return array_of_arrays
end



#step2 of merge sort-------------------------------------------------
def combine_arrays(array_of_arrays, index1, index2)
  #split arrays
  #compare array1[0] and array2[0]
  #if array1[0] is bigger, put array2[0] in new array
  #then compare array1[0] and array2[2]

  merged_array = []
  nested_array = []
  array1 = array_of_arrays[index1]
  array2 = array_of_arrays[index2]

  #binding.pry

  while (array1[0] != nil) && (array2[0] != nil)
    #puts "While loop, array1: #{array1}, array2: #{array2}"
    if array1[0] < array2[0]
      nested_array << array1[0]
      array1.shift
    elsif array1[0] > array2[0]
      nested_array << array2[0]
      array2.shift
    end #end if/else statement
    #puts "Nested array: #{nested_array}"
    #puts nil
  end #end while loop

  if (array1[0] != nil)
    nested_array << array1
  elsif (array2[0] != nil)
    nested_array << array2
  end

  merged_array << nested_array
  flatten_array = merged_array.flatten
  #puts "Exit if statement, merged array: #{flatten_array}"
  return flatten_array
end
#combine_arrays([[75, 100], [65, 85]])
#combine_arrays([[75, 100], [65, 85], [84, 87]])
#combine_arrays([[75, 100], [65, 85], [84, 87], [20, 95]], 2, 3)
#combine_arrays([[75, 100], [65, 85], [84, 87], [20]], 2, 3)


#step 1 of merge sort - returns an array of 2-element arrays-------------------------
def compare_2elements(array)
  array_of_arrays = []
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
      inner_array = [array[second_index], array[first_index]]
    elsif array[first_index] < array[second_index]
      inner_array = [array[first_index], array[second_index]]
    end #end if statement
    array_of_arrays << inner_array
    first_index += 2
    second_index += 2

    #puts "index1: #{first_index}, index2: #{second_index}, array: #{array_of_arrays}"
    #puts nil
  end #end each loop

  if last_element != nil
    #puts "I'm adding last element back: #{last_element}"
    inner_array = []
    add_last_element(last_element, inner_array)
    array_of_arrays << inner_array
  end

  #puts "Final array: #{array_of_arrays}"
  return array_of_arrays

end
#compare_2elements(scores)



#methods not being used------------------------------------------------------
# def swap_num(array)
#   num_placeholder = array[0]
#   if array[0] > array[1]
#     array[0] = array[1]
#     array[1] = num_placeholder
#   end
#   return array
# end
# # puts "#{swap_num([23, 20])}"

# def split_arrays(array)
#   length = array.length
#   mid_index = length/2
#   last_index = array.index(array.last)

#   array1 = array.slice(0, length/2)
#   array2 = array.slice(mid_index, last_index)
#   #puts "array1: #{array1}, mid: #{mid_index}, array2: #{array2}"
#   final_array = [array1, array2]
#   puts "Final array of arrays: #{final_array}"
#   return final_array
# end
# #split_arrays([1,2,3,4,5])
# #split_arrays([1,2,3,4,5,6])


# def sort_swap_array(array)
#   array.each do |num|
#     puts "Array: #{array}"
#     num1_index = array.index(num)
#     num2_index = num1_index + 1
#     if array[num1_index] > array[num2_index]
#       puts "num1: #{array[num1_index]}, num2: #{array[num2_index]}"
#       temp_num_holder = num
#       array[num1_index] = array[num2_index]
#       array[num2_index] = num
#     end
#     puts "Swapped array: #{array}"
#     puts nil
#   end #end each loop
# end
# #sort_swap_array(scores)


# def merge_sort(array)
#   sorted_array = array
#   return sorted_array
# end
