require_relative '../syntax/list_tail'
require_relative 'list'

class ListTail
  def evaluate(environment)
    list.tail.evaluate(environment)
  end
end
