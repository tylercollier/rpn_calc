require 'bigdecimal'
require 'i18n'

class InvalidOperatorException < Exception; end

class RpnCalc
  def initialize
    super
    @stack = []
  end

  def numeric_cast(input)
    # We'd use the i18n library if internationalization is needed, e.g. to
    # look for commas as the decimal separator.
    if /\./ =~ input
      Float input rescue nil
    else
      Integer input rescue nil
    end
  end

  # term is a string
  def add_term(term)
    number = self.numeric_cast term
    if number.is_a? Numeric
      @stack.push number
    else
      result = nil
      case term
      when '++', '--'
        op1 = @stack.pop
        if term == '++'
          result = op1 += 1
        else
          result = op1 -= 1
        end
      when '+', '-', '*', '/'
        op2 = @stack.pop
        op1 = @stack.pop
        result = op1.send term, op2
      else
        raise InvalidOperatorException.new "Unable to handle operator: #{term}"
      end
      @stack.push result
    end
  end

  def peek
    @stack.last
  end
end
