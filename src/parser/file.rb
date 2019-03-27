require "./src/sorting/collector"
require "./src/parser/line"

module Parser
  class File
    def initialize(file)
      @file = file
    end

    def call
      file.each_line do |line|
        parsed_line = Parser::Line.new(line)

        sorting_collector.accept_resource(
          path: parsed_line.path,
          ip_number: parsed_line.ip_number
        )
      end
      sorting_collector.resources
    end

    private

    attr_reader :file

    def sorting_collector
      @sorting_collector ||= ::Sorting::Collector.new
    end
  end
end
