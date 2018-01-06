require 'pry'

class Checksum
  def initialize(file)
    @original = []
    File.open(file, "r") do
      |f|
      while (l = f.gets)
        line = l.gsub(/\s+/m, ' ').strip.split(' ').map(&:to_i)
        @original.push(line)
      end
    end
  end
  
  def run()
    puts sum_dividables()
  end
  
  def sum_dividables()
    checksum = 0
    @original.each do
      |row|
      
      checksum += calculate_row(row)
    end
    
    return checksum
  end
  
  def calculate_row(row)
    output = 0
    row.each_with_index do
      |v, i|
      row.each_with_index do
        |v2, i2|
        next if i == i2
        output = v / v2 if v % v2 == 0
        output = v2 / v if v2 % v == 0
        break if output > 0
      end
    end
    return output
  end
end