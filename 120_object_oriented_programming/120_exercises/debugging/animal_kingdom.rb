# Animal Kingdom
# The code below raises an exception. Examine the error message and alter the code so that it runs without error.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

Discussion
On line 37 of our code (line 5 of the above solution), we must explicitly pass diet and superpower to super. These specified arguments are then sent up the method lookup chain to Animal#initialize. If we do not pass the two intended arguments to super on line 37, then all three arguments (diet, superpower, and song) that were passed into SongBird#initialize will be passed up the method lookup chain to the Animal#initialize method. This raises an ArgumentError because Animal#initialize expects two arguments rather than three.

Review this chapter of Launch School's object oriented programming book if you need a refresher on super.

Further Exploration
Is the FlightlessBird#initialize method necessary? Why or why not?

Further exploration: FlightlessBird doesn't need an initialize method. The only reason to have one is if the class has to do something different from its superclass when it gets instantiated.

Also, given that flying is how birds typically move, it's probably better to override the Animal class's #move method in the Bird class than in the Songbird class, and then override it again in the FlightlessBird class. Otherwise, birds that are not songbirds but move like songbirds (bluejays and crows come to mind) will need to duplicate the #move method in Songbird (if they move by flying, thereby violating the DRY principle.

