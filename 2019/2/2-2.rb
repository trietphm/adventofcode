def add(input, i)
  input[input[i+3]] = input[input[i+1]] + input[input[i+2]]
  input
end

def mul(input, i)
  input[input[i+3]] = input[input[i+1]] * input[input[i+2]]
  input
end

def output(input)
  i = 0
  while input[i] != 99
    if input[i] == 1
      input = add(input, i)
    elsif input[i] == 2
      input = mul(input, i)
    end
    i = i + 4
  end
  input[0]
end

input = File.readlines('input')[0].strip.split(',').map(&:to_i)
final = 19690720

(0..99).each do |noun|
  (0..99).each do |verb|
    clone = input.clone()
    clone[1] = noun
    clone[2] = verb
    if output(clone) == final
      puts noun, verb
      puts 100 * noun + verb
      exit
    end
  end
end
