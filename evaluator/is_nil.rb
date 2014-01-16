require_relative '../syntax/is_nil'
require_relative '../syntax/nil'
require_relative 'boolean'

class IsNil
  def evaluate(environment)
    Boolean.new(value.evaluate(environment).class == Nil)
  end
end
