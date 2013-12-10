require_relative 'evaluator'
require_relative 'syntax'
require_relative 'parser'
require_relative 'version'

env_result = PolakParser.new.parse(File.read(File.expand_path(ARGV[0])).chomp!).to_ast.evaluate({})

puts env_result.values.last
