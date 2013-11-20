require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    formal      = function.fetch(:formal)                       # like ["x", "y", "z" ...]
    # evaluate actual parameters in actual environment
    new_actual  = actual.map do |a| a.evaluate(environment) end # like [1, 2, 3 ...]

    if formal.size != new_actual.size
      raise RuntimeError
    end

    # map formal parameters to the actual ones
    actual_parameters = {}
    formal.each_with_index do |f, i|
      actual_parameters.merge!({ f.to_sym => new_actual[i] })
    end

    function_body        = function.fetch(:body)
    function_environment = function.fetch(:environment)
    function_body.evaluate(function_environment.merge(actual_parameters))
  end
end
