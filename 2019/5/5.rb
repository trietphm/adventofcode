def value(input, mode, i)
  mode == 0 ? input[input[i]] : input[i]
end

def add(input, i, m1, m2, m3)
  #puts m1, m2,m3
  #puts "add: input[#{input[i+3]}]= #{input[input[i+1]] + input[input[i+2]]}"
  #puts "add: input[#{value(input, m3, i+3)}]= #{value(input, m1, i+1) + value(input, m1, i+1)}"
  a = value(input, m1, i+1)
  b = value(input, m2, i + 2)
  if m3 == 0
    #puts "1, [#{input[i+3]}, #{a}, #{b}]"
    input[input[i+3]] = a + b
  else
    #puts "1, [#i+3}, #{a}, #{b}]"
    input[i+3] = a + b
  end
  4
end

def mul(input, i, m1, m2, m3)
  #puts "mul"
  a = value(input, m1, i+1)
  b = value(input, m2, i + 2)
  if m3 == 0
    #puts "2, [#{input[i+3]}, #{a}, #{b}]"
    input[input[i+3]] = a *b
  else
    #puts "2, [#i+3}, #{a}, #{b}]"
    input[i+3] = a *b
  end
  #input[value(input, m3, i+3)] = value(input, m1, i+1) * value(input, m2, i + 2)
  #input[input[i+3]] = input[input[i+1]] * input[input[i+2]]
  4
end

def out(input)
  puts "out: #{input}\n"
  2
end

def set(input, num, i)
  input[i] = num
  2
end

def parse(num)
  s = num.to_s
  while s.length < 5
    s = '0' << s
  end
  return s[0].to_i, s[1].to_i, s[2].to_i, s[3..4].to_i
end

input = File.readlines('input')[0].strip.split(',').map(&:to_i)
i = 0
#print input
#puts

mem = 1
while input[i] != 99
  m3, m2, m1, opcode = parse(input[i])
  #puts "// i: #{i}, m1=#{m1}, m2=#{m2}, m3=#{m3}, opcode: #{opcode}"
  step = case opcode
         when 1
           #puts "#{opcode} [#{m1}, #{m2}] [#{input[i+1]} #{input[i+2]} #{input[i+3]}]"
           add(input, i, m1, m2, m3)
           #print input
           #puts
         when 2
           #puts "#{opcode} [#{m1}, #{m2}] [#{input[i+1]} #{input[i+2]} #{input[i+3]}]"
           mul(input, i, m1, m2, m3)
         when 3
           set(input, mem, input[i+1])
         when 4
           out(input[input[i+1]])
         end
    i = i + step
    #puts "// input[i + #{step}]: #{input[i]}"
end

#puts
#puts
#print input
