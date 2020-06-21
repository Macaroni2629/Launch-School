def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

=begin
The original problem had three separate 'if' statements.  Due to lack of explicit
return, the last expression was always returned.   
You get nil when you pass in the first and second arguments because there is 
nothing to return.
=end