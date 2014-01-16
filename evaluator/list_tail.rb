require_relative '../syntax/list_tail'
require_relative 'list'

class ListTail
  def evaluate(environment)
    list.evaluate(environment).tail.evaluate(environment)
  end
end
