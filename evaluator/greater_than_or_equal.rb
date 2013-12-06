require_relative '../syntax/greater_than_or_equal'
require_relative 'boolean'

class GreaterThan
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value >= right.evaluate(environment).value)
  end
end
