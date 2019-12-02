def add(input, i)
  input[input[i+3]] = input[input[i+1]] + input[input[i+2]]
  input
end

def mul(input, i)
  input[input[i+3]] = input[input[i+1]] * input[input[i+2]]
  input
end

input = File.readlines('input')[0].strip.split(',').map(&:to_i)
i = 0
while input[i] != 99
  if input[i] == 1
    input = add(input, i)
  elsif input[i] == 2
    input = mul(input, i)
  end
  i = i + 4
end
puts input[0]
