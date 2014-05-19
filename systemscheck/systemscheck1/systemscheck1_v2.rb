require 'pry'

scores = [75, 100, 85, 65, 84, 87, 95, 20]
small_list = [85, 65, 100, 75, 20]




def average(array)
  length = array.length
  sum = 0

  return (sum/length.to_f)
end


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
        puts "index1: #{num1_index}, index2: #{num2_index}, array: #{array}"
        puts "inner while, index1: #{num1_index - 1}, index2: #{num1_index}"
        save_num1 = array[num1_index - 1]
        array[num1_index - 1] = array[num1_index]
        array[num1_index] = save_num1
        num1_index -= 1
        num2_index -= 1
      end #end inner while loop
      num1_index = save_index1
      num2_index = save_index2
    end
      puts "index1: #{num1_index}, index2: #{num2_index}, array: #{array}"
      puts nil

      num1_index += 1
      num2_index += 1

  end

end


sort_swap_array(small_list)
