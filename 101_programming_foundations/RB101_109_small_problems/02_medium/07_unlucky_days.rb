# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

# Examples:

require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

require 'date'

def friday_13th(year)
  d = Date.ordinal(year, 1)
  counter = 0
  365.times do |year|
    d = d.next
    if d.friday? && d.mday == 13
      counter += 1
    end
  end
  counter
end
  
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# Discussion
# This one is interesting. First, we must require the Date class, since that class isn't part of the core library. This problem asks us to find all Friday the 13ths in a given year. To do this is, we step through each month of the year and look at the 13th of the month; if it's a Friday, we increment unlucky_count.

# Further Exploration
# An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.