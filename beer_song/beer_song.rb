# Beer Song - .join("\n") must be use double quotes!!!

# Write a program that can generate the lyrics of the
# 99 Bottles of Beer song. See the test suite for the
# entire song.
class BeerSong
  def self.verses(*verse_numbers)
    output = []

    if verse_numbers.size > 1
      verse_numbers = (verse_numbers[1]..verse_numbers[0]).to_a.reverse
    end

    verse_numbers.each do |verse_number|
      output << BeerSong.verse(verse_number)
    end

    output.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end

  def self.verse(num) # flagged by rubocop - too long
    if num >= 3
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, " \
      "#{num - 1} bottles of beer on the wall.\n"
    elsif num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
      "Take it down and pass it around," \
      " no more bottles of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end

# LS solution: utilized a Verse class in addition to BeerSong class.
  # each format of verse was a separate private helper method in verse class, appeasing rubocop
  # BeerSong::verse instantiated a new Verse object each time it was invoked

class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end