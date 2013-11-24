require_relative '../syntax/subtract'

class Subtract
  def evaluate(environment)
    Number.new(left.evaluate(environment) - right.evaluate(environment))
  end
end
