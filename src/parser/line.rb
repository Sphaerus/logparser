module Parser
  class Line
    WHITESPACE = " ".freeze
    private_constant :WHITESPACE

    def initialize(string)
      @split_string = string.split(WHITESPACE)
    end

    def path
      split_string[0]
    end

    def ip_number
      split_string[1]
    end

    private

    attr_reader :split_string
  end
end
