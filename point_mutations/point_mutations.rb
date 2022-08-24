# Point Mutations

# Write a program that can calculate the Hamming distance between two DNA strands.

# A mutation is simply a mistake that occurs during the creation or copying of a
# nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
# functions, mutations tend to cause a ripple effect throughout the cell. Although
# mutations are technically mistakes, a very rare mutation may equip the cell with
# a beneficial attribute. In fact, the macro effects of evolution are attributable
# by the accumulated result of beneficial microscopic mutations over many generations.

# The simplest and most common type of nucleic acid mutation is a point mutation,
# which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length.
# If you have two sequences of unequal length, you should compute the
# Hamming distance over the shorter length.

# Hint:
# Method for calculating Hamming distance:
# How can we know which DNA strand is shorter?
# How can we count the differences between them? What kind of
# iteration will help us do that?

class DNA
  def initialize(original)
    @original = original
  end

  def hamming_distance(passed)
    if @original.length <= passed.length
      calculate_difference(@original, passed)
    else
      calculate_difference(passed, @original)
    end
  end

  def calculate_difference(str1, str2)
    difference = 0
    str1.chars.each_with_index do |char, index|
      difference += 1 if char != str2[index]
    end
    difference
  end
end

# LS Solution:

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(comparison)
#     shorter = @strand.length < comparison.length ? @strand : comparison
#     differences = 0

#     shorter.length.times do |index|
#       differences += 1 unless @strand[index] == comparison[index]
#     end

#     differences
#   end
# end