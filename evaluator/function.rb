require_relative '../syntax/function'

class Function
  def evaluate(environment)
    environment.merge({
      :formal      => formal,
      :body        => body,
      :environment => environment
    })
  end
end
