require 'execjs'

RSpec::Matchers.define :look_like do |expected|
  match do |subject|
    actual(subject) == expected
  end

  def actual(subject)
    subject.to_s
  end

  failure_message_for_should do |subject|
    "expected that #{subject.inspect} would look like #{expected.inspect}, but it looks like #{actual(subject).inspect}"
  end
end

RSpec::Matchers.define :reduce_to do |expected|
  match do |subject|
    actual(subject) == expected
  end

  def actual(subject)
    subject.reduce(environment)
  end

  def environment
    @environment || {}
  end

  chain :within do |environment|
    @environment = environment
  end

  failure_message_for_should do |subject|
    "expected that #{subject.inspect} would reduce to #{expected.inspect} within #{environment.inspect}, but it reduces to #{actual(subject).inspect}"
  end
end

RSpec::Matchers.define :evaluate_to do |expected|
  match do |subject|
    actual(subject) == expected
  end

  def actual(subject)
    subject.evaluate(environment)
  end

  def environment
    @environment || {}
  end

  chain :within do |environment|
    @environment = environment
  end

  failure_message_for_should do |subject|
    "expected that #{subject.inspect} would evaluate to #{expected.inspect} within #{environment.inspect}, but it evaluates to #{actual(subject).inspect}"
  end
end

RSpec::Matchers.define :parse_as do |expected|
  match do |subject|
    actual(subject) == expected
  end

  def actual(subject)
    parse_tree = parse(subject)
    parse_tree.to_ast unless parse_tree.nil?
  end

  def parse(string)
    parser = PolakParser.new
    [:statement, :expression].map { |root| parser.parse(string, root: root) rescue nil }.compact.first
  end

  failure_message_for_should do |subject|
    "expected that #{subject.inspect} would parse as #{expected.inspect}, but it parses as #{actual(subject).inspect}"
  end
end
