input = File.read('input')
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
puts input.strip.length
