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
  puts "#=> #{PolakParser.new.parse(gets.chomp!).to_ast.evaluate(environment)}"
rescue Exception => e
  puts e.message
end
end
