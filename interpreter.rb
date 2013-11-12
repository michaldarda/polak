puts "Witaj w interpreterze jezyka Polak (c) 2013 by Michal Darda (MIT)"
require_relative 'small_step'
require_relative 'big_step'
require_relative 'syntax'
require_relative 'parser'

while(true)
  print ">> "
begin
  Machine.new(PolakParser.new.parse(gets.chomp!).to_ast)
rescue Exception => e
  print e.message
end
  puts
end
