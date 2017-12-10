#! /usr/bin/env ruby
require 'pry'

class Captcha
  def initialize(string)
    #binding.pry
    @original = string
  end
  
  def run()
    puts process_captcha()
  end
  
  def process_captcha
    set_first()
    set_last()
    set_scan_value()
    scan()
    return sum_each(@output)
  end
  
  private def set_first
    @first = @original[0]
  end

  private def set_last
    @last = @original[-1]
  end

  private def set_scan_value
    @scan_value = @original[1..-2]
  end
  
  private def scan
    @output = ''
    @original.each_char do
      |x|
      #binding.pry
      @output += x if x === @prev
      #binding.pry
      @prev = x
    end
    @output += @last if @last === @first
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