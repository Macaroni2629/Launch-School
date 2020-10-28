After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
Disregard Daylight Savings and Standard Time and other complications.

Approach/Algorithm
The Integer#divmod method and the % (modulo) operator may prove useful in your solution. You may also find Kernel#format handy for formatting your results.

Solution

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end
Discussion
We start out this solution by defining a few useful constants so we don't have a bunch of mystery numbers in our method. The body of the method then boils down to 3 operations:

Ensure the time difference is in the range of 0...MINUTES_PER_DAY by using the % operator (it computes the remainder of dividing the left side by the right side)
Use divmod to break the time difference down into hours and minutes
Format the results with Kernel#format. Each %02d produces a two-digit number with leading zeros as needed.
Note that it is the first step that ensures that negative numbers are properly handled.

Further Exploration
How would you approach this problem if you were allowed to use ruby's Date and Time classes? Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

# Further Exploration starting with LS's original method
# without using Time or Date class
WEEK = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

def time_of_day(num)
  min = num % 1440
  hours, minutes = min.divmod(60)
  h = num / 60
  days, _ = h.divmod(24)
  week_index = days % 7
  format("#{WEEK[week_index]}, %02d:%02d", hours, minutes)
end

# Further Exploration using Time class
WEEK = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

def time_of_day(minutes)
  seconds = minutes * 60
  t1 = Time.new(0) + seconds
  t1.wday
  format("#{WEEK[t1.wday - 6]}, %02d:%02d", t1.hour, t1.min)
end