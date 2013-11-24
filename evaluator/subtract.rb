require_relative '../syntax/subtract'

class Subtract
  def evaluate(environment)
    Number.new(left.evaluate(environment).value - right.evaluate(environment).value)
  end
end
