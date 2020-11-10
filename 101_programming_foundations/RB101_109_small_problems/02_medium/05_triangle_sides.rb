# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end


def valid_triangle?(side1, side2, side3)
  if side1.zero? || side2.zero? || side3.zero?
    return false
  end

  if side1 + side2 < side3
    return false
  elsif side2 + side3 < side1
    return false
  elsif side1 + side3 < side2
    return false
  end

  true
end


def triangle(side1, side2, side3)
  return :invalid if !valid_triangle?(side1, side2, side3)

  if side1 == side2 && side2 == side3
      return :equilateral
  end

  if side1 != side2 && side1 != side3
    if side2 != side3
      return :scalene
    end
  end

  :isosceles
end


    
  
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Discussion
# A triangle's two smaller sides should be greater than the length of the largest. The thing is, we don't know which of our sides was chosen as the "largest" when we call max on sides. So, to check for this, we make sure that the total sum of the side lengths is greater than 2 times the largest side. Another way to express this would be: largest_side > sides.reduce(:+) - largest_side