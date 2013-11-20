require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    formal = function.fetch(:formal)                       # like ["x", "y", "z" ...]
    actual = actual.map do |a| a.evaluate(environment) end # like [1, 2, 3 ...]

    if formal.size != actual.size
      raise RuntimeError, "#{name}: Oczekiwano #{formal.count} argumentów, dostałem #{actual.count}"
    end

    # map formal parameters to the actual ones
    parameters = {}
    formal.each_with_index do |f, i|
      parameters.merge!({ f.to_sym => actual[i] })
    end

    function_body        = function.fetch(:body)
    function_environment = function.fetch(:environment)
    function_body.evaluate(function_environment.merge(parameters))
  end
end
