input = File.read('input')
common = ''
input.each_line.with_index do |cline, cindex|
  input.each_line.with_index do |line, index|
    next if index == cindex
    cm = ''
    cline.each_char.with_index do |c, i|
      cm += c if c == line[i]
    end
    common = cm if cm.length > common.length
  end
end
puts common
