# -*- coding: utf-8 -*-
require_relative '../syntax/function_call'
require_relative '../helpers/param_evaluator'

class FunctionCall
  def evaluate(environment)
    function = environment.fetch(name)

    function_body        = function.fetch(:body)
    function_environment = function.fetch(:environment)
    parameters           = evaluate_params(environment)

    current_env = function_environment.merge(parameters)
      .merge(name => function)

    function_body.evaluate(current_env)
  end

  private

  def evaluate_params(environment)
    function = environment.fetch(name)
    formal   = function.fetch(:formal)

    if formal.size != actual.size
      fail "#{name} przyjmuje #{actual.count} / #{formal.count} argumentów"
    end

    param_evaluator = ParamEvaluator.new(formal, actual, environment)
    param_evaluator.map_formal_to_actual
  end
end
