require_relative '../syntax/less_than_or_equal'
require_relative 'boolean'

class LessThanOrEqual
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value <= right.evaluate(environment).value)
  end
end
