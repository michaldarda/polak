require_relative '../syntax/greater_than'
require_relative 'boolean'

class GreaterThan
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value > right.evaluate(environment).value)
  end
end
