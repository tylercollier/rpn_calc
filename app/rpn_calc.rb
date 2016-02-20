require 'bigdecimal'
require_relative 'rpn/math'

class RpnCalc
  def initialize
    super
    @stack = []
    @math = RPN::Math.new
  end

  # term is a string
  def add_term(term)
    number = @math.numeric_cast term
    if number.is_a? Numeric
      @stack.push number
    else
      arity = @math.arity term
      if arity == 1
        op1 = @stack.pop
        result = @math.compute term, op1
      else
        op2 = @stack.pop
        op1 = @stack.pop
        result = @math.compute term, op1, op2
      end
      @stack.push result
    end
  end

  def peek
    @stack.last
  end
end
