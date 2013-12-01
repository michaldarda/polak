# -*- coding: utf-8 -*-
require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    # ["x", "y", "z" ...]
    formal = function.fetch(:formal)

    # evaluate each parameter in current environment
    evaluated_actual = actual.map do |param|
      param.evaluate(environment)
    end

    if formal.size != actual.size
      raise RuntimeError, "#{name}: Oczekiwano #{formal.count} argumentów, dostałem #{actual.count}"
    end

    # map formal parameters to the actual ones
    parameters = {}
    formal.each_with_index do |f, i|
      parameters.merge!({ f.to_sym => evaluated_actual[i] })
    end

    function_body        = function.fetch(:body)
    function_environment = function.fetch(:environment)

    puts function_environment.merge(parameters).merge(name => function)

    function_body.evaluate(function_environment.merge(parameters).merge(name => function))
  end
end
