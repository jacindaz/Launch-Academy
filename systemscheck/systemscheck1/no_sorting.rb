require 'pry'


scores = [75, 100, 85, 65, 84, 87, 95]
scores2 = [98, 32, 75, 60, 54, 88, 100, 27, 81]
all_same = [1,2,3,4,5,6,7]
reverse_sorted = [6,5,4,3,2,1]
one_out_of_order = [5,6,7,8,9,10, 4]
one_out_of_order_reverse = [10,5,6,7,8,9]



def avg_min_max(array)

  min = array[0]
  max = array[0]
  sum = 0

  array.each do |num|
    if num > max
      max = num
    elsif num < min
      min = num
    end
  end

  array.each do |num|
    sum += num
  end

  avg = sum / (array.length.to_f)

  puts "Array: #{array}"
  puts "Min: #{min}, Max: #{max}, Average: #{avg}"

end
avg_min_max(reverse_sorted)
