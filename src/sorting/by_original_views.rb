require "./src/printer/by_original_views"

module Sorting
  class ByOriginalViews
    def initialize(resources:)
      @resources = resources
    end

    def call
      resources
        .sort_by { |path, counter| counter[:uniq_count] }
        .reverse.map do |array|
          Printer::ByOriginalViews.new(array[0], array[1][:uniq_count]).call
        end
    end

    private

    attr_reader :resources
  end
end
