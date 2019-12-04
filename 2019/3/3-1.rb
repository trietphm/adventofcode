FILENAME='input'

@grid = nil
@step_counts = nil
@intersection = []
@min_x, @min_y, @max_x, @max_y = nil, nil, nil, nil

def plus(direction)
  case direction
    when 'U'
      {x: 0, y: 1}
    when 'D'
      {x: 0, y: -1}
    when 'L'
      {x: -1, y: 0}
    when 'R'
      {x: 1, y: 0}
  end
end

def write_map(wire, x, y, marker)
  step_count = 0
  wire.each do |path|
    h = plus(path[:direction])
    (1..path[:steps]).each do
      step_count +=1
      x += h[:x]
      y += h[:y]
      if @grid[x][y] != 0 && @grid[x][y] != marker
        @grid[x][y] = 3
        @intersection << {x: x,y: y, step_count: step_count + @step_counts[x][y]}
      else
        @grid[x][y] = marker
      end
      @step_counts[x][y] = step_count
    end
  end
end

def parse(raw_wire)
  x, y = 0, 0
  wire = []
  raw_wire.each do |path|
    direction = path[0]
    number_of_steps = path[1..path.length-1].to_i
    wire << {direction: direction, steps: number_of_steps}
    case direction
      when 'U'
        y += number_of_steps
      when 'D'
        y -= number_of_steps
      when 'L'
        x -= number_of_steps
      when 'R'
        x += number_of_steps
    end

    @min_x = x if @min_x.nil? || @min_x > x
    @min_y = y if @min_y.nil? || @min_y > y
    @max_x = x if @max_x.nil? || @max_x < x
    @max_y = y if @max_y.nil? || @max_y < y
  end
  wire
end

def input(filename)
  input = File.readlines(filename)
  wire_a = parse(input[0].strip.split(','))
  wire_b = parse(input[1].strip.split(','))

  @grid = Array.new(@min_x.abs + @max_x.abs + 1, 0) {Array.new(@min_y.abs + @max_y.abs + 1, 0)}
  @step_counts = Array.new(@min_x.abs + @max_x.abs + 1, 0) {Array.new(@min_y.abs + @max_y.abs + 1, 0)}

  write_map(wire_a, @min_x.clone.abs, @min_y.clone.abs, 1)
  write_map(wire_b, @min_x.clone.abs, @min_y.clone.abs, 2)
end

def distance(src, dest)
  (src[:x] - dest[:x]).abs + (src[:y] - dest[:y]).abs
end

def print_grid
  def colorize(color_code, t)
    "\e[#{color_code}m#{t}\e[0m"
  end

  def red(t)
    colorize(31, t)
  end

  def green(t)
      colorize(32, t)
  end

  def yellow(t)
    colorize(33, t)
  end

  @grid.each {|line|
    line.each { |x|
      if x == 1
        print red('x')
      elsif x == 2
        print green('x')
      elsif x == 3
        print yellow('O')
      else
        print "."
      end
    }
    puts
  }
end

input(FILENAME)
min_step = nil

#print_grid
@intersection.each do |point|
  min_step = point[:step_count] if min_step.nil? || min_step > point[:step_count]
end

puts @intersection
puts @min_x, @min_y
puts min_step
