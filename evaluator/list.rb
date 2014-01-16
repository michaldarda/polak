require_relative '../syntax/list'

class List
  def evaluate(environment)
    List.new(head.evaluate(environment), tail.evaluate(environment))
  end
end
