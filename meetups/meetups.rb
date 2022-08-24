# Meetups

# Meetups are a great way to meet people who share a common interest.
# Typically, meetups happen monthly on the same day of the week. For example,
# a meetup's meeting may be set as:

# The first Monday of January 2021
# The third Tuesday of December 2020
# The teenth wednesday of December 2020
# The last Thursday of January 2021
# In this program, we'll construct objects that represent a meetup date.
# Each object takes a month number (1-12) and a year (e.g., 2021). Your
# object should be able to determine the exact date of the meeting in the
# specified month and year. For instance, if you ask for the 2nd Wednesday
# of May 2021, the object should be able to determine that the meetup for
# that month will occur on the 12th of May, 2021.

# The descriptors that may be given are strings: 'first', 'second', 'third',
# 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not important;
# that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word.
# There was a meetup whose members realised that there are exactly 7 days that end
# in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...)
#   will have exactly one date that is the "teenth" of that day in every month.
#   That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc.
#   The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday',
# 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings
# is not important.

require 'date'

DAYS_OF_WEEK = {
  'sunday' => 0,
  'monday' => 1,
  'tuesday' => 2,
  'wednesday' => 3,
  'thursday' => 4,
  'friday' => 5,
  'saturday' => 6
}

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day, schedule)
    schedule = schedule.downcase.to_sym
    day = day.downcase
    send(schedule, day)
  end

  def get_possible_dates(day)
    d1 = Date.civil(@year, @month, 1)
    d2 = Date.civil(@year, @month, -1)

    dates = []
    d1.upto(d2) do |date|
      dates << date if date.wday == DAYS_OF_WEEK[day]
    end
    dates
  end

  def first(day)
    possible_dates = get_possible_dates(day)
    possible_dates[0]
  end

  def second(day)
    possible_dates = get_possible_dates(day)
    possible_dates[1]
  end

  def third(day)
    possible_dates = get_possible_dates(day)
    possible_dates[2]
  end

  def fourth(day)
    possible_dates = get_possible_dates(day)
    possible_dates[3]
  end

  def fifth(day)
    possible_dates = get_possible_dates(day)
    possible_dates[4]
  end

  def last(day)
    possible_dates = get_possible_dates(day)
    possible_dates[-1]
  end

  def teenth(day)
    teenth_dates = [13, 14, 15, 16, 17, 18, 19]
    possible_dates = get_possible_dates(day)
    possible_dates.select do |date|
      teenth_dates.include?(date.day)
    end.first
  end
end

meetup = Meetup.new(2013, 5)
p meetup.day('tuesday', 'firsT')

