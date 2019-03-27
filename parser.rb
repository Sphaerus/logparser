require "./src/parser/web_log"

parser = Parser::WebLog.new(File.open(ARGV[0]))

puts parser.parsed_log
