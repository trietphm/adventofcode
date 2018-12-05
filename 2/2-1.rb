input = File.read('input')
count_two = 0
count_three = 0
input.each_line do |line|
  m = {}
  line.each_char do |c|
    m[c] = if m[c].nil?
             1
           else
             m[c] + 1
           end
  end

  t2 = 0
  t3 = 0
  m.each do |_, value|
    t2 = 1 if value == 2
    t3 = 1 if value == 3
  end
  count_two += t2
  count_three += t3
end

puts count_two, count_three, count_two * count_three
