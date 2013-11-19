require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    function_body = function.fetch(:body)
    function_environment = function.fetch(:environment)

    function_body.evaluate(function_environment)
  end
end
