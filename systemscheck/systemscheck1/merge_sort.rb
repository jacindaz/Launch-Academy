require 'pry'
scores = [75, 100, 85, 65, 84, 87, 95]
reverse = [6,5,4,3,2,1]



def merge_sort(array)



end

merge_sort(scores)


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
merge_sort_2element(reverse)
