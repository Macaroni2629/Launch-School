# Seeing Stars
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

# Examples

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
  
# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
  
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

# Discussion
# This problem is nearly identical to an earlier problem in the Medium section, Diamonds, though the results look a bit different. The solution itself is very similar, so should be easy to understand if you understood the previous solution. There are two differences of note.

# The first difference occurs in the main method, which we call star in our solution. In diamond, we didn't need any special handling for the middle row of our diamond since it fit the same pattern of the rows above and below it. This is not the case with our star, so we have to handle the middle line separately. Fortunately, this is easy to do.

# The other difference is in print_row. Here we take a slightly different route to constructing the output string, though in the end we do exactly the same thing by printing the row centered within the grid size.

# Further Exploration
# What other patterns can you come up with that can be produced in similar ways to the patterns of this exercise? Can you draw a reasonable looking circle? How about a sine wave?