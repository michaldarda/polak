# -*- coding: utf-8 -*-
require_relative '../syntax/function_call'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)
    formal = function.fetch(:formal)

    if formal.size != actual.size
      raise "#{name}: Oczekiwano #{formal.count} argumentów,
        dostałem #{actual.count}"
    end

    function_body        = function.fetch(:body)
    function_environment = function.fetch(:environment)

    parameters = map_formal_to_evaluated_actual(formal, actual, environment)

    current_env = function_environment.merge(parameters)
      .merge(name => function)

    function_body.evaluate(current_env)
  end

  protected

  # evaluate each parameter in current environment
  def evaluate_actual(actual, environment)
    actual.map do |param|
      param.evaluate(environment)
    end
  end

  def map_formal_to_evaluated_actual(formal, actual, environment)
    evaluated_actual = evaluate_actual(actual, environment)

    parameters = {}
    formal.each_with_index do |f, i|
      parameters.merge!(f.to_sym => evaluated_actual[i])
    end
    parameters
  end
end
