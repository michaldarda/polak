class ParamEvaluator < Struct.new(:formal, :actual, :environment)
  def map_formal_to_actual
    evaluated_actual = evaluate_actual

    formal.each_with_index.reduce({}) do |result, (param, i)|
      result.merge(param.to_sym => evaluated_actual[i])
    end
  end

  private

  def evaluate_actual
    actual.map do |param|
      param.evaluate(environment)
    end
  end
end
