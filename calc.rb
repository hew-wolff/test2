class Calc
  def initialize
    @vars = {}
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
    value = evaluate_add_expression(expr)
    var ? @vars[var] = value : value
  end

  def evaluate_add_expression(s)
    ops_re = /[+-]/
    add_terms = s.split(ops_re)
    add_ops = ['+'] + s.scan(ops_re).to_a
    op_terms = add_ops.zip(add_terms)
    op_terms.reduce(0) do |acc, v|
      is_negative = v[0] == '-'
      next_value = evaluate_mult_expression(v[1])
      acc + (is_negative ? -next_value : next_value)
    end
  end


  def evaluate_mult_expression(s)
    ops_re = /[*\/]/
    terms = s.split(ops_re)
    ops = ['*'] + s.scan(ops_re).to_a
    op_terms = ops.zip(terms)
    op_terms.reduce(1) do |acc, v|
      is_div = v[0] == '/'
      next_value = evaluate_simple_term(v[1])
      acc * (is_div ? 1/next_value : next_value)
    end
  end

  def evaluate_simple_term(t)
    @vars[t] || t.to_f
  end
end
