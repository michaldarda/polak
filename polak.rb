require_relative 'evaluator'
require_relative 'parser'

module Polak
  def self.eval(expression)
    return PolakParser.new.parse(expression).to_ast.evaluate({})
  end
end
