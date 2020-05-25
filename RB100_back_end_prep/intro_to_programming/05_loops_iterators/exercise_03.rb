def count_down_to_zero(number)
    if number <= 0
        puts 0
    else
        puts number
        count_down_to_zero(number - 1)
    end 
end

count_down_to_zero(10)