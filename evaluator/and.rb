require_relative '../syntax/and'
require_relative 'boolean'

class And
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value && right.evaluate(environment).value)
  end
end
