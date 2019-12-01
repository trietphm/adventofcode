input = File.read('input').each_line.map(&:to_i)
m = {}

r = 0
while true do
  input.each do |f|
    r = f + r
    if m[r].nil?
      m[r] = r
    else
      puts m[r]
      return
    end
  end
end
