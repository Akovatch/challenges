# Perfect Number

# The Greek mathematician Nicomachus devised a classification
# scheme for natural numbers (1, 2, 3, ...), identifying
# each as belonging uniquely to the categories of abundant,
# perfect, or deficient based on a comparison between the number
# and the sum of its positive divisors (the numbers that can be
# evenly divided into the target number with no remainder,
# excluding the number itself). For instance, the positive
# divisors of 15 are 1, 3, and 5. This sum is known as the
# Aliquot sum.

  # Perfect numbers have an Aliquot sum that is equal to the
  # original number.

  # Abundant numbers have an Aliquot sum that is greater than
  # the original number.

  # Deficient numbers have an Aliquot sum that is less than the
  # original number.

# Examples:

  # 6 is a perfect number since its divisors are 1, 2, and 3,
  # and 1 + 2 + 3 = 6.

  # 28 is a perfect number since its divisors are 1, 2, 4, 7,
  # and 14 and 1 + 2 + 4 + 7 + 14 = 28.

  # 15 is a deficient number since its divisors are 1, 3, and
  # 5 and 1 + 3 + 5 = 9 which is less than 15.

  # 24 is an abundant number since its divisors are 1, 2, 3,
  # 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which
  # is greater than 24.

  # Prime numbers 7, 13, etc. are always deficient since their
  # only divisor is 1.

# Write a program that can tell whether a number is perfect,
# abundant, or deficient.

class PerfectNumber
  def self.classify(num)
    raise StandardError, 'Invalid input' if num <= 0
    sum = (1...num).to_a.select { |n| num % n == 0 }.sum
    PerfectNumber.determine_classification(num, sum)
  end

  def self.determine_classification(num, sum) # return a string
    if sum > num
      'abundant'
    elsif sum < num
      'deficient'
    else
      'perfect'
    end
  end
end

# LS solution: same logic, but they made their helper method private using
  # the class << self idiom

  # class PerfectNumber
  #   def self.classify(number)
  #     raise StandardError.new if number < 1
  #     sum = sum_of_factors(number)

  #     if sum == number
  #       'perfect'
  #     elsif sum > number
  #       'abundant'
  #     else
  #       'deficient'
  #     end
  #   end

  #   class << self
  #     private

  #     def sum_of_factors(number)
  #       (1...number).select do |possible_divisor|
  #         number % possible_divisor == 0
  #       end.sum
  #     end
  #   end
  # end