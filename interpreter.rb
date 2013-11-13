puts "Witaj w interpreterze jezyka Polak (c) 2013 by Michal Darda (MIT)"
require_relative 'evaluator'
require_relative 'syntax'
require_relative 'parser'
require_relative 'version'

environment = {}

while(true)
  STDOUT.flush
  print "#{POLAK_VERSION} >> "
begin
  last = PolakParser.new.parse(gets.chomp!).to_ast.evaluate(environment)

  puts "#=> #{last}"
  if last.is_a?(Hash)
    environment.merge!(last)
  end
rescue Exception => e
  puts "SyntaxError"
end
end
