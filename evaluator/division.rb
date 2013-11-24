require_relative '../syntax/division'
require_relative 'number'

class Division
  def evaluate(environment)
    Number.new(left.evaluate(environment).value / right.evaluate(environment).value)
  end
end
