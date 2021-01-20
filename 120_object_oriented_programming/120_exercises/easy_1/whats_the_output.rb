# What's the Output?
# Take a look at the following code:


class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name #Fluffy
puts fluffy #My name is FLUFFY.
puts fluffy.name #FLUFFY
puts name #FLUFFY

# What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

# Solution
# Output:

# Fluffy
# My name is FLUFFY.
# FLUFFY
# FLUFFY

# Corrected Class:

class  Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# Discussion
# The original version of #to_s uses String#upcase! which mutates its argument in place. This causes @name to be modified, which in turn causes name to be modified: this is because @name and name reference the same object in memory.

# Oh, and that to_s inside the initialize method? We need that for the challenge under Further Exploration.

# Further Exploration
# What would happen in this case?


# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name
# This code "works" because of that mysterious to_s call in Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?