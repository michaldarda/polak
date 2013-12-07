require_relative '../syntax/multitive'
require_relative 'number'

class Multitive
  def evaluate(environment)
    Number.new(left.evaluate(environment).value.send(operator, right.evaluate(environment).value))
  end
end
