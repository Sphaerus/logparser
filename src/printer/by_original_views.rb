module Printer
  class ByOriginalViews
    def initialize(path, count)
      @path = path
      @count = count
    end

    def call
      "#{path} #{count} unique views"
    end

    private

    attr_reader :path, :count
  end
end
