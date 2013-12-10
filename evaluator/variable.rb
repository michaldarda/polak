require_relative '../syntax/variable'

class Variable
  def evaluate(environment)
    name = name.to_s.split(".").map { |n| n.to_sym }
    name.inject(environment) { |acc, value| acc.fetch(value) }
  end
end
