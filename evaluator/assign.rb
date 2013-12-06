require_relative '../syntax/assign'

class Assign
  def evaluate(environment)
    raise "Nie mogę przypisać zmiennej bo jest przypisana wczesniej, użyj niech! aby przypisać" if environment[name]

    environment.merge({ name => expression.evaluate(environment) })
  end
end
