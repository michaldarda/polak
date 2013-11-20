require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    # ["x", "y", "z" ...]
    formal = function.fetch(:formal)

    formal ||= []
    # [1, 2, 3 ...]
    actual ||= []

    # evaluate each parameter in current environment
    actual = actual.map do |a|
      a.evaluate(environment)
    end

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
