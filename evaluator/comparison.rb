require_relative '../syntax/comparison'
require_relative 'boolean'

class Comparison
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value.send(operator, right.evaluate(environment).value))
  end
end
