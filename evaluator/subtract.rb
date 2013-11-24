require_relative '../syntax/subtract'
require_relative 'number'

class Subtract
  def evaluate(environment)
    Number.new(left.evaluate(environment).value - right.evaluate(environment).value)
  end
end
