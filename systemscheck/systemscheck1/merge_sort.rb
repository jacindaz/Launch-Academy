#require 'pry'
scores = [75, 100, 85, 65, 84, 87, 95]
reverse = [6,5,4,3,2,1]



def merge_sort(array)
  original_array = array
  new_array = []

  index1 = 0
  index2 = 2
  merged_array_index = 0

  while (array.last != nil)
    if (array[index1] == nil) || (array[index2] == nil)
      next
    end
    puts "Merged: #{new_array}, Original: #{array}"
    puts "Index1: #{index1}, Index2: #{index2}, Num1: #{array[index1]}, Num2: #{array[index2]}"
    puts nil
    if array[index2] < array[index1]
      new_array[merged_array_index] = array[index2]
      array[index2] = nil
      index2 += 1
    elsif array[index1] < array[index2]
      new_array[merged_array_index] = array[index1]
      array[index1] = nil
      index1 += 1
    elsif (array[index1] == nil) && (array[index2] == nil)
      index1 += 1
      index2 += 1
    end
    merged_array_index += 1
  end #end while loop

  return new_array

end

merge_sort([5, 6, 3, 4, 1, 2, 7, 8])


def merge_sort_2element(array)
  index = 0
  while array[index] != nil
    puts "Array: #{array}, index: #{index}"
    if array[index] > array[index + 1]
      save_num1 = array[index]
      array[index] = array[index + 1]
      array[index + 1] = save_num1
    end
    index += 2
    puts "Array: #{array}, index: #{index}"
  end
end
#merge_sort_2element(scores)
#merge_sort_2element(reverse)
