puts File.read('input').each_line.reduce(0) { |r, f| f.to_i+r }
