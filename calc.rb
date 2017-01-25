class Calc
  def initialize
  end

  def evaluate(expression)
    add_terms = expression.split(/\+/)
    add_ops = ['+'] + expression.scan(/\+/).to_a
    op_terms = add_ops.zip(add_terms)
    op_terms.reduce(0) do |acc, v|
      is_negative = v[0] == '-'
      next_value = evaluate_add_term(v[1])
      acc + (is_negative ? -next_value : next_value)
    end
  end

  def evaluate_add_term(s)
    s.to_f
  end
end
