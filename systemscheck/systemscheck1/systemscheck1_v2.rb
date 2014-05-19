require 'pry'

scores = [75, 100, 85, 65, 84, 87, 95, 20]




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

  array.each do |num|

    index = 0
    puts "array: #{array}, num: #{num}, next num: #{array[index + 1]}, index: #{index}"
    #binding.pry

    if (num != array.last) && (num > array[index + 1])
      puts "if statement,num: #{num} array+1: #{array[index + 1]}"
      puts nil
      while (num != array.last) && (num > array[index + 1])
        placeholder = num
        array[index] = array[index + 1]
        array[index + 1] = num
        index += 1
        puts "while loop, array: #{array}, index: #{index}, num: #{num}"
      end #end while statement
    else
      index += 1
    end #end if loop
  end #each each loop

end

sort_swap_array(scores)
