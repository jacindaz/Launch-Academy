require 'pry'
require 'rio'

#ABOUT THE WORD_COUNT METHOD---------------------------------
#read a certain file until a specified line number
#then return a hash with the count of each word

def word_count(file_name, line)
  #file_array = []
  count_words_hash = {}
  line_index = 0

  while line_index <= line
    line_text = rio("hamlet.txt").lines[line_index]
    line_array_index0 = line_text[0]
    words_array = line_array_index0.split(" ")

    #puts "Line array string: #{line_array_index0}"
    words_array.each do |word|
      #puts "Line text: #{line_text}, word: #{word}, index: #{line_index}"
      if !count_words_hash.has_key?(word)
        count_words_hash[word] = 0
      end
      count_words_hash[word] += 1
    end #end array each loop
    line_index += 1
  end #end while loop
  puts "Final hash: #{count_words_hash}"

  return count_words_hash

end #end read_file method


word_count("hamlet.txt", 3)
