require 'pry'
require 'pp'

first = 1
last  = ARGV[0].to_i
matrix = {0=>{}}
pos = {:y=>0, :x=>0}
dir = :s


first.upto(last) do |num|
  if dir == :s then
    matrix[pos[:y]][pos[:x]] = num
    dir = :r1
    
  elsif dir == :r1 then
    pos[:x] += 1
    dir = :u if matrix[pos[:y]].length == pos[:x]

    matrix[pos[:y]][pos[:x]] = num
  elsif dir == :r then
    pos[:x] += 1
    dir = :u if matrix[pos[:y]].length == matrix[pos[:y] - 1].length
    
    matrix[pos[:y]][pos[:x]] = num
  elsif dir == :u then
    pos[:y] -= 1
    matrix[pos[:y]] ||= {}
    dir = :l if matrix[pos[:y]].length == 0
    
    matrix[pos[:y]][pos[:x]] = num
  elsif dir == :l then
    pos[:x] -= 1
    dir = :d if matrix[pos[:y]].length == matrix[pos[:y] + 1].length
    
    matrix[pos[:y]][pos[:x]] = num
  elsif dir == :d then
    pos[:y] += 1
    matrix[pos[:y]] ||= {}
    dir = :r if matrix[pos[:y]].length == 0
    
    matrix[pos[:y]][pos[:x]] = num  
  end
end
    

x = (pos[:x] >= 0) ? pos[:x] : pos[:x] * -1
y = (pos[:y] >= 0) ? pos[:y] : pos[:y] * -1
puts "#{x+y} steps"
    

