require_relative '../syntax/additive'
require_relative 'number'

class Additive
  def evaluate(environment)
    Number.new(left.evaluate(environment).value.send(operator, right.evaluate(environment).value))
  end
end
