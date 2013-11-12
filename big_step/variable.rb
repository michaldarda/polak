require_relative '../syntax/variable'

class Variable
  def evaluate(environment)
    environment.fetch(:name)
  end
end
