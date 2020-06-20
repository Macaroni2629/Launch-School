pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push('bowser')

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

# You want to add to an array.  So you must look up arrays in the docs.
# Then, look how to add an element to an array.  You will see
# that a.push('string') is how you do it.

