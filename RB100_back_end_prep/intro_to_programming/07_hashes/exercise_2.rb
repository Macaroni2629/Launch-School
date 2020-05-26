cat = {name: "whiskers"}
weight = {weight: "10 lbs"}

puts cat.merge(weight) # returns new hash with 2 key value pairs
puts weight #returns original hash
puts cat.merge!(weight) # returns with the object mutated into the new hash
puts cat #returns the new mutated hash to show the destructiveness of the bang
puts weight # returns untouched hash since it was the calling object
