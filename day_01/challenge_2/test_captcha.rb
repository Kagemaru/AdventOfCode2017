#! /usr/bin/env ruby

require_relative 'captcha'
require 'minitest/autorun'
#require 'test/unit'

class TestCaptcha < Minitest::Test
  def test_given
    assert_equal(6, Captcha.new('1212').process_captcha())
    assert_equal(0, Captcha.new('1221').process_captcha())
    assert_equal(4, Captcha.new('123425').process_captcha())
    assert_equal(12, Captcha.new('123123').process_captcha())
    assert_equal(4, Captcha.new('12131415').process_captcha())
  end
end