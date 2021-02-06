# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?
  
class BeesWax
  def initialize(type)
    @typae = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
  
# We can add attr_accessor to the top of the class. And it will give us the ability to get and set the @type instance variable the same as we can do now.

# This simplifies the class substantially and now the class would look like:

# class BeesWax
#   attr_accessor :type

#   def initialize(type)
#     @type = type
#   end

#   def describe_type
#     puts "I am a #{@type} type of Bees Wax"
#   end
# end
# While this is much better, there is still something we can improve.

# Currently, inside the describe_type method, we are referencing the @type variable with the @ symbol, but this is not needed. As there is a method in the class which replaces the need to access the instance variable directly we can change the describe_type method to be:

# def describe_type
#   puts "I am a #{type} type of Bees Wax"
# end
# This is much cleaner, and it is standard practice to refer to instance variables inside the class without @ if the getter method is available.