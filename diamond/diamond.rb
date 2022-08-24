# Diamond - OUTPUT IS A STRING!

# The diamond exercise takes as its input a letter, and outputs it in a diamond shape.
# Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.
# Examples

# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A

class Diamond

  def self.make_diamond(max_letter)
    output = []
    alpha_hash = generate_alpha_hash
    max_width = alpha_hash[max_letter] + 2
    return "A\n" if max_letter == 'A'
    output << "A".center(max_width) + "\n"
    output << build_top(max_letter, max_width, alpha_hash)
    output << build_bottom(max_letter, max_width, alpha_hash)
    output << "A".center(max_width) + "\n"
    output.join
  end

  class << self

    private

    def generate_alpha_hash
      result = {}
      ('A'..'Z').each_with_index do |letter, index|
        result[letter] = letter == 'A' ? 1 : (2 * index) - 1
      end
      result
    end

    def build_top(max_letter, max_width, alpha_hash)
      output = []
      ('B'..max_letter).each do |letter|
        spaces = alpha_hash[letter]
        output << (letter + (' ' * spaces) + letter).center(max_width) + "\n"
      end
      output.join
    end

    def build_bottom(max_letter, max_width, alpha_hash)
      output = []
      ('B'..max_letter).to_a.reverse.each do |letter|
        next if letter == max_letter
        spaces = alpha_hash[letter]
        output << (letter + (' ' * spaces) + letter).center(max_width) + "\n"
      end
      output.join
    end
  end
end

p Diamond.make_diamond("E")