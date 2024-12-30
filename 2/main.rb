def validate(arr)
  increasing = true
  decreasing = true
  valid_differences = true
  num_bad_levels = 0
  bad_level_idx = nil
  ret = false

  (0...arr.length - 1).each do |i|
    diff = arr[i + 1] - arr[i]
    increasing &= diff > 0
    decreasing &= diff < 0
    valid_differences &= diff.abs.between?(1, 3)
    ret = valid_differences && (increasing || decreasing)
    num_bad_levels = !ret ? num_bad_levels + 1 : num_bad_levels
    bad_level_idx = i
  end
  [ret, num_bad_levels, bad_level_idx]
end

def isSafe?(arr)
  bad_level_idx, num_bad_levels, ret = validate(ret)
  if num_bad_levels == 1
    arr.delete_at(idx)
    puts arr
    _,_,ret = validate(arr)
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
