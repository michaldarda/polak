require_relative '../syntax/force_assign'

class ForceAssign
  def evaluate(environment)
    environment.merge({ name => expression.evaluate(environment) })
  end
end
