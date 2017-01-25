require_relative 'calc'
require 'test/unit'
 
class TestCalc < Test::Unit::TestCase
  def setup
    @c = Calc.new
  end
  
  def test_plus
    assert_equal 1, @c.evaluate("1")
    assert_equal 3, @c.evaluate("1+2")
    assert_equal 6, @c.evaluate("1+2+3")
  end
  
  def test_minus
    assert_equal -1, @c.evaluate("1-2")
    assert_equal 2, @c.evaluate("1-2+3")
    assert_equal -4, @c.evaluate("1-2-3")
    assert_equal -2, @c.evaluate("1-2+3-4")
  end
  
  def test_mult
    assert_equal 2, @c.evaluate("1*2")
    assert_equal 5, @c.evaluate("1*2+3")
    assert_equal 6, @c.evaluate("1*2*3")
    assert_equal 7, @c.evaluate("1+2*3")
    assert_equal 30, @c.evaluate("1+2*3*4+5")
  end
  
  def test_div
    assert_close 1.0/2, @c.evaluate("1/2")
    assert_close 2.0/3, @c.evaluate("1*2/3")
    assert_close 10.0/3, @c.evaluate("1/2/3*4*5")
  end

  def test_all
    assert_close 1 + 2/3.0 - 4*5*6/7.0 - 8*9, @c.evaluate("1+2/3-4*5*6/7-8*9")
  end

  def assert_close(expected, actual)
    assert_in_delta expected, actual
  end
end
