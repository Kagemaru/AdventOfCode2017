#! /usr/bin/env ruby

require_relative 'checksum'
require 'minitest/autorun'
#require 'test/unit'

class TestChecksum < Minitest::Test
  def test_given
    assert_equal(18, Captcha.new('test.txt').process_captcha())
  end
end