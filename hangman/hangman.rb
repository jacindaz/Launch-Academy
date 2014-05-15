#!/usr/bin/env ruby

=begin
 - generate a random word, save in a variable
 - set chances to 8 (or later can change for user to set # of chances)
 - loop until chances = 0 or when user guesses the word
      if correct:
        - update word: _____ with appropriate letters
        - found x occurences of the particular letter

      if incorrect:
        - Sorry, this particular letter not found

      for both:
        - update # of chances
        - display the word again
        - "guess a single letter (a-z)......"

=end

require 'random-word'

def randomWord
  puts "Would you like a noun or an adjective? (a/n)"
  user_input = gets.chomp

  #generates a random adjective or noun
  random_adj = RandomWord.adjs.next
  random_noun = RandomWord.nouns.next

  if user_input == "a"
    #puts "Random adj: #{random_adj}"
    return random_adj
  elsif user_input == "n"
    #puts "Random noun: #{random_noun}"
    return random_noun
  end #end if statement
end

def generateDashes(length)
  string = ""
  length.times do |one_dash|
    string.concat("_")
  end
  return string
end
#puts generateDashes(8)

def addLetters(word, letter, user_guess_word)
  count = 0
  word.split("").each do |char|
    if char == letter
      #puts "char: #{char}, letter: #{letter}, index: #{word.index(letter)}, word: #{user_guess_word}, count: #{count}"
      user_guess_word[word.index(char, count)] = letter
    end
    count += 1
  end
  return user_guess_word
end
#puts addLetters("jacinda", "a", "_______")

def countLetter(word, letter)
  count = 0
  word.split("").each do |char|
    if char == letter
      count += 1
    end
  end
  return count
end
#puts countLetter("jacinda", "a")

def hangman
  puts "Welcome to Hangman!"

  random_word = randomWord
  random_word_len = random_word.length
  chances = random_word_len + 1
  #puts "Random word: #{random_word}"
  user_guess_word = generateDashes(random_word_len)

  while (chances > 0) && (random_word != user_guess_word)
    puts nil
    puts "Word: #{user_guess_word}"
    #puts "Word: #{random_word}"
    puts "Chances remaining: #{chances}"
    print "Guess a single letter (a-z) or the entire word: "
    user_guess_letter = gets.chomp

    #if the user guess letter was found in word
    if random_word.include?(user_guess_letter)
      puts nil
      puts "Found #{countLetter(random_word, user_guess_letter)} occurrence(s) of the character #{user_guess_letter}."
      #puts "Letter was found, word: #{random_word}, letter guessed: #{user_guess_letter}"
      addLetters(random_word, user_guess_letter, user_guess_word)
    #if the user guess was not found in the word
    elsif !(random_word.include?(user_guess_letter))
      puts "Sorry, no #{user_guess_letter}'s found."
      #puts "Letter NOT found, word: #{random_word}, letter guessed: #{user_guess_letter}"
    end #end if statement

    chances -= 1

  end #end chances while loop

  if chances == 0
    puts "You're out of chances, better luck next time..."
  elsif (random_word == user_guess_letter) || (random_word == user_guess_word)
    puts nil
    puts "Congratulations, you've guessed the word!"
  end

end

hangman

















