# How big is the room?
# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

def length_room
  
  puts "Enter the length of the room in meters:"
  length_of_room = gets.chomp.to_i
  
  puts "Enter the width of the room in meters:"
  width_of_room = gets.chomp.to_f
  
  
  area = length_of_room * width_of_room
  area_in_feet = area * 10.7639
  area_in_feet = area_in_feet.round(2)
  
  puts "The area of the room is #{area} square meters (#{area_in_feet} square feet.)"
  
end

length_room