class Pet
  attr_reader :animal, :name
  def initialize(animal, name)
    @animal = animal
    @name = name
  end
  
  def to_s
    "a #{self.animal} named #{self.name}"
  end
  
end

class Owner
  attr_reader :pets, :name
  attr_accessor :number_of_pets
  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end
  
end

class Shelter
  attr_reader :adopters
  
  def initialize
    @adopters = []
  end
    
  def adopt(adopter, pet)
    adopter.pets << pet
    adopters << adopter unless adopters.include?(adopter)
    adopter.number_of_pets += 1
  end
  
  def print_adoptions
    adopters.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
          adopter.pets.each do |pet|
            puts pet
          end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')




shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

class Pet
#   attr_reader :animal_type, :name
#   def initialize(animal_type, name)
#     @animal_type = animal_type
#     @name = name
#   end
# end

# class Owner
#   attr_reader :name
#   attr_accessor :number_of_pets
  
#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end
# end

# class Shelter
#   #attr_reader :adoption_record # self.adoption_record (getter) ??????
#   def initialize
#     @adoption_record = {} # {owner.name: [animal1, animal2]}
#   end 
  
#   def adopt(owner, animal)
#     # now we have access to one owner and one animal (objects)
#     if @adoption_record[owner] == nil
#       @adoption_record[owner] = [animal]
#     else
#       @adoption_record[owner] << animal
#     end
#     owner.number_of_pets += 1
#   end
  
#   def print_adoptions
#     # @adoption_record => { phanson => [butterscotch, pudding, darwin], ...}
#     @adoption_record.each do | owner, array_of_pets |
#       puts "#{owner.name} has adopted the following pets:"
#       array_of_pets.each do |pet|
#         puts "a #{pet.animal_type} named #{pet.name}"
#       end
#       puts ""
#     end
#   end
# end