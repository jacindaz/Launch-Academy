#file = File.read("hamlet.txt")
#read_file = IO.readlines("hamlet.txt")
#puts read_file[0]
#puts read_file[1]
require 'pry'
require 'rio'

def read_file(file_name)
  #file_array = []
  count_words_hash = {}
  count_lines = 0

  IO.foreach(file_name) do |line|
    puts "Line: #{count_lines}, text: #{line}"
      file_array = line.split(" ")
      file_array.each do |word|
        if !count_words_hash.has_key?(word)
          count_words_hash[word] = 0
        end
        count_words_hash[word] += 1
      end #end array each loop
  end #end file read each line loop

  puts "Final hash: #{count_words_hash}, count: #{count_lines}"
end
read_file("hamlet.txt")
