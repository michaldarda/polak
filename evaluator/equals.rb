require_relative '../syntax/equals'

class Equals
  def evaluate(environment)
    Boolean.new(left.evaluate(environment) == right.evaluate(environment))
  end
end
