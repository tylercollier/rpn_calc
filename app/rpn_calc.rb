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
      operands = []
      arity.times do
        operands.push @stack.pop
      end
      result = @math.compute term, *(operands.reverse)
      @stack.push result
    end
  end

  def peek
    @stack.last
  end
end
