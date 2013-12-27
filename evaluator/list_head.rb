require_relative '../syntax/list_head'
require_relative 'list'

class ListHead
  def evaluate(environment)
    list.head.evaluate(environment)
  end
end
