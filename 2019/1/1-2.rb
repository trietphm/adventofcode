def fuel(f)
  r = 0
  while f > 0
    f = f/3 - 2
    r = r + f if f > 0
  end
  r
end

puts File.read('input').each_line.map(&:to_i).reduce(0) { |r, f| r + fuel(f)}
