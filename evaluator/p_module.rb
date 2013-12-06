require_relative '../syntax/p_module'

class PModule
  def evaluate(environment)
    environment.merge({ name => content.evaluate(enviroment) })
  end
end
