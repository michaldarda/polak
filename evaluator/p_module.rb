require_relative '../syntax/p_module'

class PModule
  def evaluate(environment)
    content.evaluate(environment)
  end
end
