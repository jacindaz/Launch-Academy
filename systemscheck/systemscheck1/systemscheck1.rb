require_relative 'systemscheck1-methods'
require 'pry'


scores = [75, 100, 85, 65, 84, 87, 95]
scores2 = [98, 32, 75, 60, 54, 88, 100, 27, 81]

# print out the average score, the lowest score, and the max score

# YOUR CODE GOES HERE

#sort the list
#return the last value (which will be the largest value)
#return the first value (which will be the smallest)
#average: find the length of array, loop through array and sum


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
  #step 1 of merge sort
  compare_elements(array)

  #step 2 - split into
end
#merge_sort(scores)
merge_sort(scores2)
