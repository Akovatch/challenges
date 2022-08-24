# Robot Name

# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.

# The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, which means
# that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence. Random names
# means there is a risk of collisions. Your solution should not allow the use of the same
# name twice when avoidable.

class Robot
  @@used_names = []

  attr_reader :name

  def initialize
    @name = generate_name
  end

  def generate_name
    random_name = ''
    unique_name = false

    while unique_name == false
      random_name = generate_random_sequence
      unique_name = true unless @@used_names.include?(random_name)
    end
    @@used_names << random_name
    @name = random_name
  end

  def generate_random_sequence
    ('A'..'Z').to_a.sample(2).join + rand(100..1000).to_s
  end

  def reset
    @@names.used_names.delete(@name)
    @name = generate_name
  end
end
