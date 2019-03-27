require "spec_helper"
require "./src/parser/web_log"

RSpec.describe Parser::WebLog do
  let(:parser) { described_class.new(file) }
  let(:file) { File.open("./spec/lib/webserver.log") }

  describe "#parsed_log" do
    subject { parser.parsed_log }
    let(:expected) do
      [
        "List of webpages with most page views ordered from most pages views to less page views",
        "/help_page/1 5 visits",
        "/home 3 visits",
        "/contact 3 visits",
        "/about/2 2 visits",
        "/about 1 visits",
        "/index 1 visits",
        "List of webpages with most unique page views",
        "/help_page/1 5 unique views",
        "/home 3 unique views",
        "/contact 2 unique views",
        "/about 1 unique views",
        "/index 1 unique views",
        "/about/2 1 unique views",
      ].join("\n")
    end

    it "return printed lines" do
      expect(subject).to eq(expected)
    end
  end

end
