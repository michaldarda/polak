require_relative '../syntax/nil'

class Nil
  def evaluate(environment)
    self
  end
end
