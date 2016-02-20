module RPN
  class InvalidOperatorError < StandardError; end

  class Math
    def numeric_cast(input)
      # We'd use the i18n library if internationalization is needed, e.g. to
      # look for commas as the decimal separator.
      # Casting to an integer, as opposed to always a float, is one simple way
      # to output an integer when the input is an integer (i.e. no decimal
      # shown), as the example gist does.
      if /\./ =~ input
        Float input rescue nil
      else
        Integer input rescue nil
      end
    end

    def arity(operator)
      case operator
      when '++', '--'
        1
      when '+', '-', '*', '/'
        2
      else
        raise InvalidOperatorError.new "Unable to handle operator: #{operator}"
      end
    end

    def compute(operator, *operands)
      case operator
      when '++', '--'
        if operator == '++'
          result = operands[0] += 1
        else
          result = operands[0] -= 1
        end
      when '+', '-', '*'
        result = operands[0].send operator, operands[1]
      when '/'
        result = operands[0].to_f / operands[1]
      else
        raise InvalidOperatorError.new "Unable to handle operator: #{operator}"
      end
    end
  end
end
