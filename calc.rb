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
      begin
        calc.add_term chomped
        puts calc.peek
      rescue => error
        puts error.message
      end
    end
  end
end

runner = Runner.new
runner.run()
