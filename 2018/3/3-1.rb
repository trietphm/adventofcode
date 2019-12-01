input = File.read('input').each_line.reduce([]) do |r, line|
  s = line.split(' ')
  r << {
    id: s[0][1..-1].to_i,
    left: s[2].split(',')[0].to_i,
    top: s[2].split(',')[1][0..-2].to_i,
    width: s[3].split('x')[0].to_i,
    height: s[3].split('x')[1].to_i
  }
end

fabric = Array.new(2000, [])
fabric = fabric.map { |item| Array.new(2000, 0) }
input.each { |item|
  item[:width].times { |w|
    item[:height].times { |h|
        fabric[item[:left] + w - 1][item[:top] + h - 1] += 1
    }
  }
}

c = 0
fabric.each { |line|
  line.each { |v|
    c +=1 if v > 1
  }
}
puts c

input.each { |item|
  ch = true
  item[:width].times { |w|
    item[:height].times { |h|
      if fabric[item[:left] + w - 1][item[:top] + h - 1] > 1
        ch = false
      end
    }
  }

  if ch
      puts item
  end
}

