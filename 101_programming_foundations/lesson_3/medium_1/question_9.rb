=begin

Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
What would be the return value of the following method invocation?

bar(foo)

"no" because foo always returns yes.
yes does not equal no.  So false. So no.


=end