require_relative '../syntax/or'
require_relative 'boolean'

class And
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value || right.evaluate(environment).value)
  end
end
