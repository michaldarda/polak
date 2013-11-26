require_relative '../syntax/divide'
require_relative 'number'

class Divide
  def evaluate(environment)
    Number.new(left.evaluate(environment).value / right.evaluate(environment).value)
  end
end
