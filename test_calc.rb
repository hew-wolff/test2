require_relative 'calc'
require 'test/unit'
 
class TestCalc < Test::Unit::TestCase
  def setup
    @c = Calc.new
  end
  
  def test_simple
    assert_equal 1, @c.evaluate("1")
    assert_equal 3, @c.evaluate("1+2")
    assert_equal 6, @c.evaluate("1+2+3")
  end
  
  def test_negative
    assert_equal -1, @c.evaluate("1-2")
    assert_equal 2, @c.evaluate("1-2+3")
    assert_equal -4, @c.evaluate("1-2-3")
    assert_equal -2, @c.evaluate("1-2+3-4")
  end
end
