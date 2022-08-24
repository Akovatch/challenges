# Series

# Write a program that will take a string of digits and
# return all the possible consecutive number series of a
# specified length in that string.

# For example, the string "01234" has the following
# 3-digit series:

# 012
# 123
# 234

# Likewise, here are the 4-digit series:

# 0123
# 1234

# Finally, if you ask for a 6-digit series from a
# 5-digit string, you should throw an error.

class Series
  def initialize(string_num)
    @string_num = string_num
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @string_num.length

    result = []
    @string_num.chars.map(&:to_i).each_cons(slice_length) do |slice|
      result << slice
    end
    result
  end
end

# LS Solution:

class Series
  attr_accessor :number_string

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end