require_relative '../syntax/list_head'
require_relative 'list'

class ListHead
  def evaluate(environment)
    ListHead.new(list.evaluate(environment))
  end
end
