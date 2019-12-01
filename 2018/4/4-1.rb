input = File.read('input').split("\n").sort

current_id = -1
tracker = {}
sleep_at = 0
input.each do |line|
  m = line.match /\[\d+-\d+-\d+ (?<hour>\d+):(?<minute>\d+)\] Guard #(?<id>\d+) begins shift/
  unless m.nil?
    # Shift
    id = m[:id]
    current_id = id
    tracker[id] = Array.new(60, 0) if tracker[id].nil?
    next
  end

  m = line.match /\[\d+-\d+-\d+ \d+:(?<minute>\d+)\] falls asleep/
  unless m.nil?
    # track sleep time
    sleep_at = m[:minute].to_i
  end

  m = line.match /\[\d+-\d+-\d+ \d+:(?<minute>\d+)\] wakes up/
  unless m.nil?
    # track sleep time
    (sleep_at..(m[:minute].to_i - 1)).each do |minute|
      tracker[current_id][minute] += 1
    end
  end
end
tracker.each do |k,v|
  puts "ID: #{k}, #{v.count { |x| x > 0 }}"
end
puts
tracker.each do |k,v|
  puts "ID: #{k}, #{v.max}"
end
print tracker['1973'][37]
