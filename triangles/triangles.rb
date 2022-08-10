# Write a program to determine whether a triangle is equilateral,
# isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of
# length > 0, and the sum of the lengths of any two sides must be
# greater than the length of the third side.

# input: Creating a new traingle object with 3 integer arguments
# output: string
# rules:
  # (above)
# Examples:
  # we need at Triangle class
  # we need a constructor (two helper methods)
    # take 3 arguments - verify all sides are greater than 0, otherwise raises ArgumentError
    # verify that it is a valid triangle - otherwise raises ArgumentError
# Data structure:
  # array

# Algorithm:
  # Contructor verifies validity of triangle with two helper methods
    # greater_than_zero?
      # returns true if a single side is greater than 0, otherwise AE
    # valid_triangle?
      # compare all three sides
        #
  # kind method determines type by comparing sides

class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new("Not a valid triangle") unless valid_triangle?
  end

  def valid_triangle?
    @sides.min > 0
    @sides[0] + @sides[1] > @sides[2] &&
    @sides[1] + @sides[2] > @sides[0] &&
    @sides[2] + @sides[0] > @sides[1]
  end

  def kind
    if @sides[0] == @sides[1] && @sides[1] == @sides[2]
      'equilateral'
    elsif @sides[0] == @sides[1] || @sides[1] == @sides[2] || @sides[0] == @sides[2]
      'isosceles'
    else
      'scalene'
    end
  end
end

triangle = Triangle.new(2, 5, 4)
p triangle.kind

# LS Solution using Array#uniq:

# class Triangle
#   attr_reader :sides

#   def initialize(side1, side2, side3)
#     @sides = [side1, side2, side3]
#     raise ArgumentError.new "Invalid triangle lengths" unless valid?
#   end

#   def kind
#     if sides.uniq.size == 1
#       'equilateral'
#     elsif sides.uniq.size == 2
#       'isosceles'
#     else
#       'scalene'
#     end
#   end

#   private

#   def valid?
#     sides.min > 0 &&
#     sides[0] + sides[1] > sides[2] &&
#     sides[1] + sides[2] > sides[0] &&
#     sides[0] + sides[2] > sides[1]
#   end
# end