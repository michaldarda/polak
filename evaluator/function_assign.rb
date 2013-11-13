require_relative '../syntax/function_assign'

class FunctionAssign
  def evaluate(environment)
    environment.merge({ name => function.evaluate(environment) })
  end
end
