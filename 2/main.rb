def isSafe?(arr)
  puts " array: #{arr}"
  increasing = true
  decreasing = true
  valid_differences = true
  ret = false
  (0...arr.length - 1).each do |i|
    diff = arr[i + 1] - arr[i]
    increasing &= diff > 0
    decreasing &= diff < 0
    valid_differences &= diff.abs.between?(1, 3)
    ret = valid_differences && (increasing || decreasing)
    puts ret
    puts "diff: #{diff}: increasing:#{increasing}, decreasing: #{decreasing} valid_diff: #{valid_differences}, result: #{ret}"
  end
  return ret
end


is_safe = 0
File.open("levels.txt") do |file|
  file.each_line do |line|
    list = []
    list.concat(line.split.map(&:to_i)) 
    is_safe += 1 if isSafe?(list)
  end
end
puts is_safe
