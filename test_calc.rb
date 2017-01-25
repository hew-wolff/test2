require_relative 'calc'
require 'test/unit'
 
class TestCalc < Test::Unit::TestCase
  def setup
    @calc = Calc.new
  end
  
  def test_simple
    assert_equal 1, calc.evaluate("1")
    assert_equal 3, calc.evaluate("1+2")
    assert_equal 6, calc.evaluate("1+2+3")
  end
end
