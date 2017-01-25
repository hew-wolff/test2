class Calc
  def initialize
  end

  def evaluate(s)
    parts = s.split('=')
    if (parts.length == 1) then
      var = nil
      expr = parts[0]
    else
      var = parts[0]
      expr = parts[1]
    end
    #puts "expression: #{expression}"
    evaluate_add_expression(expr)
  end

  def evaluate_add_expression(s)
    ops_re = /[+-]/
    add_terms = s.split(ops_re)
    #puts "add_terms: #{add_terms}"
    add_ops = ['+'] + s.scan(ops_re).to_a
    #puts "add_ops: #{add_ops}"
    op_terms = add_ops.zip(add_terms)
    op_terms.reduce(0) do |acc, v|
      #puts "acc: #{acc}"
      is_negative = v[0] == '-'
      #puts "is_neg: #{is_negative}"
      next_value = evaluate_mult_expression(v[1])
      #puts "value: #{next_value}"
      acc + (is_negative ? -next_value : next_value)
    end
  end


  def evaluate_mult_expression(s)
    ops_re = /[*\/]/
    terms = s.split(ops_re)
    #puts "add_terms: #{add_terms}"
    ops = ['*'] + s.scan(ops_re).to_a
    #puts "add_ops: #{add_ops}"
    op_terms = ops.zip(terms)
    op_terms.reduce(1) do |acc, v|
      #puts "acc: #{acc}"
      is_div = v[0] == '/'
      #puts "is_neg: #{is_negative}"
      next_value = evaluate_simple_term(v[1])
      #puts "value: #{next_value}"
      #acc + (is_negative ? -next_value : next_value)
      acc * (is_div ? 1/next_value : next_value)
    end
  end

  def evaluate_simple_term(t)
    t.to_f
  end
end
