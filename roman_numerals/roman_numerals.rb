# Roman Numerals - hint...consider using #divmod

# Write some code that converts modern decimal numbers into their Roman number equivalents.

# The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years.
# They invented concrete and straight roads and even bikinis. One thing they never discovered though
# was the number zero. This made writing and dating extensive histories of their exploits slightly
# more challenging, but the system of numbers they came up with is still in use today. For example
# the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots
# of straight lines and are hence easy to hack into stone tablets.

# 1  => I
# 10  => X
# 7  => VII

# There is no need to be able to convert numbers larger than about 3000.
# (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit
# separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII
# See also: On Roman Numerals

ROMAN_NUMERALS = {
  'M' => 1000,
  'D' => 500,
  'C' => 100,
  'L' => 50,
  'X' => 10,
  'V' => 5,
  'I' => 1
}

class RomanNumeral
  def initialize(num)
    @num = num
  end

  def to_roman
    to_convert = @num
    result = ''
    ROMAN_NUMERALS.each do |key, value|
      result << key * (to_convert / value)
      to_convert = to_convert % value
    end

    convert_fours_and_nines(result) # correcting 4's and 9's using regex
  end

  def convert_fours_and_nines(input)
    input.gsub!(/DCCCC/, 'CM') if input =~ /DCCCC/
    input.gsub!(/CCCC/, 'CD') if input =~ /CCCC/
    input.gsub!(/LXXXX/, 'XC') if input =~ /LXXXX/
    input.gsub!(/XXXX/, 'XL') if input =~ /XXXX/
    input.gsub!(/VIIII/, 'IX') if input =~ /VIIII/
    input.gsub!(/IIII/, 'IV') if input =~ /IIII/
    input
  end
end

# LS solution: iterating through ROMAN_NUMERALS hash and using divmod to get divisor and remainder

# class RomanNumeral
#   attr_accessor :number

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end