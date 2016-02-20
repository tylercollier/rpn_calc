#!/usr/bin/env ruby

require_relative 'app/rpn_calc'

class Runner
  def prompt(output)
    print output
    gets
  end

  def run
    calc = RpnCalc.new
    while input = self.prompt('> ')
      return if input == nil
      chomped = input.chomp
      return if chomped == 'q'
      calc.add_term chomped
      puts calc.peek
    end
  end
end

runner = Runner.new
runner.run()
