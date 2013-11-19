require_relative '../syntax/function'

class Function
  def evaluate(environment)
    {
      :body        => body,
      :environment => environment
    }
  end
end
