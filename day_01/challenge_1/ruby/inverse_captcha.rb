#! /usr/bin/env ruby
require_relative 'captcha'

if ARGV[0] === '-f'
  line = File.open(ARGV[1], 'r').gets.chomp.to_s
else
  line = ARGV[0].chomp.to_s
end

c = Captcha.new(line).run()