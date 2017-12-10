#! /usr/bin/env ruby

require_relative 'captcha'
require 'minitest/autorun'
#require 'test/unit'

class TestCaptcha < Minitest::Test
  def test_given
    assert_equal(3, Captcha.new('1122').process_captcha())
    assert_equal(4, Captcha.new('1111').process_captcha())
    assert_equal(0, Captcha.new('1234').process_captcha())
    assert_equal(9, Captcha.new('91212129').process_captcha())
  end
end