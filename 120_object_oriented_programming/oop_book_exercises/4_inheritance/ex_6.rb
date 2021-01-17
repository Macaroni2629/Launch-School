# Write a method called age that calls a private method to
#  calculate the age of the vehicle. Make sure the private 
#  method is not available from outside of the class. You'll 
#  need to use Ruby's built-in Time class to help.

class Vehicle
  # code omitted for brevity...
  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

# code omitted for brevity...

puts lumina.age   #=> "Your chevy lumina is 17 years old"