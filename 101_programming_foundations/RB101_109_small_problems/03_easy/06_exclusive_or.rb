# Exclusive Or
# The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both operands are falsey. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

# Examples:

def xor?(num1, num2)
  if num1 == true && num2 == false
    return true
  elsif num1 == false && num2 == true
    return true
  end
  false
end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# This implementation is straightforward; it simply returns true if exactly one of the values is truthy; otherwise, it returns false. The explicit false return isn't actually necessary since return true if value2 && !value1 returns nil if the condition is falsey. However, methods whose name ends in a ? should usually only return the explicit true and false values.

# A shorter version of this method is:

# def xor?(value1, value2)
#   !!((value1 && !value2) || (value2 && !value1))
# end
# This is more idiomatic ruby than the first solution, but it does take a little more effort to figure out what is going on. Note that this solution requires !! to force the return value to a boolean.

# Some of you may be tempted to use the ^ operator for this exercise. The ^ operator is a bit-wise operator for performing exclusive-or bit operations. In some cases, you can use ^ as an exclusive-or operator. However, it only works properly when both values are numeric or both are boolean -- anything else may lead to unexpected results. For instance, you might expect the following expression to return a truthy value:

# 'a' ^ false
# It doesn't. Instead, it raises an error. Confusingly, the following returns a truth value:

# false ^ 'a'
# Further Exploration
# Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.

# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

# Does the xor method perform short- circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

# The xor method is not a short circuit operator because both sides have to be evaluated. One side must be true and the other side must be false when comparing both Booleans. The xor method shows that there are two combination that meet that criteria.