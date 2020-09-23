['ant', 'bear', 'caterpillar'].pop.size

# => 11

# pop is being called on the array.  pop destructively removes the last element from the calling array and returns it.

# size is being called on the return value by pop, which in this case, is 'caterpillar.'