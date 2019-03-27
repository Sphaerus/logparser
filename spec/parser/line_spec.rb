require "spec_helper"
require "./src/parser/line"

RSpec.describe Parser::Line do
  let(:parser) { described_class.new(string) }
  let(:string) { [path, ip_number].join(" ") }
  let(:ip_number) { "382.335.626.855" }
  let(:path) { "/about/2" }

  describe "#path" do
    subject { parser.path }

    it "returns path" do
      expect(subject).to eq path
    end
  end

  describe "#ip_number" do
    subject { parser.ip_number }

    it "returns ip number" do
      expect(subject).to eq ip_number
    end
  end
end
