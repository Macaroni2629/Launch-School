def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# Will return 0, 1, 2, and then nil because 'return' did not provide a value.