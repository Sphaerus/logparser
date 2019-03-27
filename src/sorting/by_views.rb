require "./src/printer/by_views"

module Sorting
  class ByViews
    def initialize(resources:)
      @resources = resources
    end

    def call
      resources
        .sort_by { |path, counter| counter[:count] }
        .reverse.map do |array|
          Printer::ByViews.new(array[0], array[1][:count]).call
        end
    end

    private

    attr_reader :resources
  end
end
