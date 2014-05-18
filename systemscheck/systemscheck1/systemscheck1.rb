require_relative 'systemscheck1-methods'
require 'pry'

# def assert_equals(a, b)
#   if a != b
#     raise "assertion failed: #{a} does not equal #{b}"
#   end
# end


scores = [75, 100, 85, 65, 84, 87, 95]
scores2 = [98, 32, 75, 60, 54, 88, 100, 27, 81]
all_same = [1,2,3,4,5,6,7]
reverse_sorted = [5,4,3,2,1]
one_out_of_order = [5,6,7,8,9,10, 4]
one_out_of_order_reverse = [10,5,6,7,8,9]



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


def merge_sort(array)
  #step 1 of merge sort, returns an array of arrays
  compare_elements2(array)

  #step 2 - split into
end
#merge_sort(scores)
merge_sort(reverse_sorted)


#tests
# assert_equals(merge_sort([]), 0)
# assert_equals(score(["2♠"]), 2)
# assert_equals(score(["10♣"]), 10)
# assert_equals(score(["K♣"]), 10)
# assert_equals(score(["A♦"]), 11)
# assert_equals(score(["2♠", "8♣"]), 10)
# assert_equals(score(["A♦", "A♠"]), 12)
# assert_equals(score(["10♦", "3♠", "10♣"]), 23)
# assert_equals(score(["A♦", "A♠", "10♣"]), 12)
# assert_equals(score(["A♦", "A♠", "K♣"]), 12)


# puts "If you get here, all tests passing..."
