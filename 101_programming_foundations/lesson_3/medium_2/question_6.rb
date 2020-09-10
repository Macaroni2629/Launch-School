=begin

How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

Ruby will automatically evaluate the statements.  It can be refactored to as follows:

Udef color_valid(color)
  color == "blue" || color == "green"
end

=end