#! /usr/bin/env ruby

require_relative 'checksum'
require 'minitest/autorun'
#require 'test/unit'

class TestChecksum < Minitest::Test
  def test_given
    c = Checksum.new('test.txt')
    assert_equal(4, c.calculate_row([5,9,2,8]))
    assert_equal(3, c.calculate_row([9,4,7,3]))
    assert_equal(2, c.calculate_row([3,8,6,5]))
    assert_equal(9, c.sum_dividables())
  end
end