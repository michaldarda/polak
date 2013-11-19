require_relative '../syntax/function'

class Function
  def evaluate(environment)
    {
      :formal      => formal,
      :body        => body,
      :environment => environment
    }
  end
end
