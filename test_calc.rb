require_relative 'calc'
require 'test/unit'
 
class TestCalc < Test::Unit::TestCase
  def setup
  end
  
  def test
    calc = Calc.new
    assert_equal 2, calc.evaluate("1+1")
  end
end
