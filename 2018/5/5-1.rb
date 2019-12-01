def reacting(input)
  i = 0
  while i < input.length - 1
    if input[i] != input[i + 1] &&
       input[i].casecmp(input[i + 1]) == 0
      input.slice!(i, 2)
      i -= 1 if i > 0
    else
      i += 1
    end
  end
  input
end


input = File.read('input')

p1 = input
puts reacting(p1).strip.length

min = input.length
('A'..'Z').each do |char|
  r = input.gsub(char, '').gsub(char.downcase, '')
  re = reacting(r).strip.length
  min = re if min > re
end
puts min
