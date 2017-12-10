#! /usr/bin/env ruby
require 'pry'

class Captcha
  def initialize(string)
    @original = string
  end
  
  def run()
    puts process_captcha()
  end
  
  def process_captcha
    set_first()
    set_last()
    scan()
    return sum_each(@output)
  end
  
  private def set_first
    @first = @original[0]
  end

  private def set_last
    @last = @original[-1]
  end
  
  private def scan
    @output = ''
    @loop = @original + @original
    @lookahead = @original.length / 2
    
    @original.each_char.with_index(0) do
      |x, i|
      @output += x if x === @loop[i+@lookahead]
    end
  end
  
  private def check_placement(x)
    
  end
  
  private def sum_each(list)
    sum = 0
    list.each_char do
      |x|
      sum += x.to_i
    end
    return sum
  end
end