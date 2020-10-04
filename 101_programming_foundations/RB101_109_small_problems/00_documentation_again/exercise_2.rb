# Optional Arguments Redux
# Assume you have the following code:

require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)
puts Date.new(2016, 5, 13, Date::ITALY)

#What will each of the 4 puts statements print?

=begin

Date is a class method.


This is the signature.

new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date

Note that brackets mean the arguments are optional.

Date.new # everything defaults
Date.new(2016) # month, mday, start use defaults
Date.new(2016, 5) #mday, start use defaults
Date.new(2016, 5, 13) # start uses default
Date.new(2016, 5, 13, Date:ITALY) # nothing defaults

If no year is given, the default year is -4712.

=end


