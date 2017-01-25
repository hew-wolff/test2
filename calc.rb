class Calc
  def initialize
  end

  def evaluate(expression)
    #puts "expression: #{expression}"
    ops_re = /[+-]/
    add_terms = expression.split(ops_re)
    #puts "add_terms: #{add_terms}"
    add_ops = ['+'] + expression.scan(ops_re).to_a
    #puts "add_ops: #{add_ops}"
    op_terms = add_ops.zip(add_terms)
    op_terms.reduce(0) do |acc, v|
      #puts "acc: #{acc}"
      is_negative = v[0] == '-'
      #puts "is_neg: #{is_negative}"
      next_value = evaluate_add_term(v[1])
      #puts "value: #{next_value}"
      acc + (is_negative ? -next_value : next_value)
    end
  end

  def evaluate_add_term(expression)
    ops_re = /[*\/]/
    terms = expression.split(ops_re)
    #puts "add_terms: #{add_terms}"
    ops = ['*'] + expression.scan(ops_re).to_a
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
