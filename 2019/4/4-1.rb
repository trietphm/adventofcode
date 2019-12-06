#from = [1, 8, 8, 9, 9, 9]
#to = [1, 8, 8, 9, 9, 9]


from = [1, 7, 8, 4, 1, 6]
to = [6, 7, 6, 4, 6, 1]

def is_not_descrease(numbers)
  (0..numbers.length-2).each do |i|
    return false if numbers[i] > numbers[i+1]
  end
  true
end

def has_double_and_not_in_group(numbers)
  (0..numbers.length-2).each do |i|
    if i != 0 && i != numbers.length - 2
      return true if numbers[i] == numbers[i+1] && numbers[i] != numbers[i-1] && numbers[i+1] != numbers[i+2]
    elsif i == 0
      return true if numbers[0] == numbers[1] && numbers[1] != numbers[2]
    elsif i == numbers.length - 2
      return true if numbers[i] == numbers[i+1] && numbers[i] != numbers[i-1]
    end
  end
  false
end

def plus_one(number)
  i = 5
  while i >= 0
    number[i] += 1
    break if number[i] < 10
    number[i] = 0
    i -= 1
  end

  number
end

def is_equal(a, b)
  a.each_with_index do |v, i|
    return false if v != b[i]
  end
  true
end

def count(from, to)
  count = 0
  number = from.clone
  while true
    if has_double_and_not_in_group(number) && is_not_descrease(number)
      count += 1
    end
    break if is_equal(number, to)
    plus_one(number)
  end
  count
end

puts count(from, to)
