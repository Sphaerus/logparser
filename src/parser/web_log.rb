require "./src/sorting/by_views"
require "./src/sorting/by_original_views"
require "./src/parser/file"

module Parser
  class WebLog
    BY_VIEWS_FIRST_LINE = "List of webpages with most page views ordered from most pages views to less page views".freeze
    BY_VIEWS_ORIGINAL_FIRST_LINE = "List of webpages with most unique page views".freeze
    private_constant :BY_VIEWS_FIRST_LINE, :BY_VIEWS_ORIGINAL_FIRST_LINE

    def initialize(file)
      @file = file
    end

    def parsed_log
      [
        BY_VIEWS_FIRST_LINE,
        Sorting::ByViews.new(resources: parsed_file).call,
        BY_VIEWS_ORIGINAL_FIRST_LINE,
        Sorting::ByOriginalViews.new(resources: parsed_file).call
      ].flatten.join("\n")
    end

    private

    attr_reader :file

    def parsed_file
      @parsed_file ||= Parser::File.new(file).call
    end
  end
end
