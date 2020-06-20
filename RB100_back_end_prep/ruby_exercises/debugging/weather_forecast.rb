def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

# All objects in Ruby except for nil and false evaluate as true.
# Therefore, line 4 will always evaluate to true.
# You must change from 'true', 'false' string objects to the booleans
# true and false on line 2, as depicted here.