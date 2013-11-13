require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    environment.fetch(name).call
  end
end
