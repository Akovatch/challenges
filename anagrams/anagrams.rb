# Anagrams

# Write a program that takes a word and a list of possible anagrams and
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like
# "enlists", "google", "inlets", and "banana", the program should return
# a list containing "inlets". Please read the test suite for the exact
# rules of anagrams.

class Anagram
  def initialize(word)
    @word = word
  end

  def match(anagrams)
    result = []
    anagrams.each do |anagram|
      next if anagram.downcase == @word.downcase
      if anagram.downcase.chars.sort == @word.downcase.chars.sort
        result << anagram
      end
    end
    result.sort
  end
end

# LS solution: similar logic, but used #select and more helper methods

# class Anagram
#   attr_reader :word

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select do |ana|
#       ana.downcase != word && anagram?(ana, word)
#     end
#   end

#   private

#   def sorted_letters(str)
#     str.downcase.chars.sort.join
#   end

#   def anagram?(word1, word2)
#     sorted_letters(word1) == sorted_letters(word2)
#   end
# end
