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
    puts calculate_checksum()
  end
  
  def calculate_checksum()
    checksum = 0
    @original.each do
      |row|
      checksum += calculate_row(row)
    end
    
    return checksum
  end
  
  private def calculate_row(row)
    return row.max - row.min
  end
end