# Sum of Multiples

# Write a program that, given a natural number and a set
# of one or more other numbers, can find the sum of all
# the multiples of the numbers in the set that are less
# than the first number. If the set of numbers is not
# given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up
# to, but not including, 20 that are multiples of either
# 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum
# of these multiples is 78.

# input: integer representing
# output:
# required: (class method will instantiate an object and call # methods)
  # SumOfMultiples class
  # #initialize that takes one or more multiples as arguments
    # NOTE: variable number of arguments ([] and *)
  # ::to class method that takes a limit only
  # #to method that takes a limit
# rules:
  # if not set is given, use 3 and 5
# algorithm:
  # #to
    # init result array
    # iterate from 1 - limit (#each)
      # nested iteration
        # number evenly divisible by a divisor
    # return sum of result array

class SumOfMultiples
  def initialize(*divisors)
    @divisors = (divisors.size > 0) ? divisors : [3, 5]
  end

  def to(limit)
    (1...limit).select do |n|
      @divisors.any? do |divisor|
        n % divisor == 0
      end
    end.sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
end
