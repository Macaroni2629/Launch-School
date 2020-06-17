daylight = [true, false].sample

def time_of_day(daylight)
  daylight ? "It's daytime!" : "It's night time!"
end

puts time_of_day(daylight)

