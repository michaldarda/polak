require_relative '../syntax/division'

class Division
  def evaluate(environment)
    Number.new(left.evaluate(environment).value / right.evaluate(environment).value)
  end
end
