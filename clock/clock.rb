# Clock

# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time represented by a
# given clock object. Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic operations.

class Clock
  def initialize(minutes=0)
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    time = (hour * 60) + minutes
    Clock.new(time)
  end

  def +(minutes)
    @minutes += minutes
    Clock.new(@minutes)
  end

  def -(minutes)
    @minutes -= minutes
    Clock.new(@minutes)
  end

  def to_s
    time = wrap_around
    hours, minutes = time.divmod(60)
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def wrap_around
    minutes = @minutes
    if minutes > 1440
      minutes -= 1440 while minutes > 1440
    elsif minutes < 0
      minutes += 1440 while minutes < 0
    end
    minutes
  end

end
