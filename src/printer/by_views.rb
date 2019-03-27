module Printer
  class ByViews
    def initialize(path, count)
      @path = path
      @count = count
    end

    def call
      "#{path} #{count} visits"
    end

    private

    attr_reader :path, :count
  end
end
