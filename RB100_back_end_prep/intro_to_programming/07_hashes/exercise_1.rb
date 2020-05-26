immediate_family = family.select do |k, v|
    k == :sisters || k == :brothers
end 

arr = immediate_family.values.flatten

p arr