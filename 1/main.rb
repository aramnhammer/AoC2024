#class Hola
#  def self.hi
#    puts "hello"
#  end
#end
# Hola.hi
l1 = []
l2 = []
sim_score = 0

File.open("historical_lists.txt") do |file|
  file.each_line do |line|
    n1, n2 = line.split.map(&:to_i)
    l1 << n1
    l2 << n2
  end
end

l1.each do |item|
  sim_score += item * l2.count(item)
end

puts sim_score

#l1.sort!
#l2.sort!
#result = 0
#
#l1.zip(l2) do |x, y|
#  dif = x-y
#  result += dif.abs
#end
#
#puts result
