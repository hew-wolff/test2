require_relative 'calc'

calc = Calc.new

while true
  puts '>'
  line = gets
  val = calc.evaluate(line)
  puts val
end
