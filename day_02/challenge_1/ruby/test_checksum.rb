#! /usr/bin/env ruby

require_relative 'checksum'
require 'minitest/autorun'
#require 'test/unit'

class TestChecksum < Minitest::Test
  def test_given
    c = Checksum.new('test.txt')
    assert_equal(8, c.calculate_row([5,1,9,5]))
    assert_equal(4, c.calculate_row([7,5,3]))
    assert_equal(6, c.calculate_row([2,4,6,8]))
    assert_equal(18, c.calculate_checksum())
  end
end