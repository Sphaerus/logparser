require "spec_helper"
require "./src/printer/by_views"

RSpec.describe Printer::ByViews do
  let(:printer) { described_class.new(path, count) }
  let(:count) { 12 }
  let(:path)  { "path/"}

  describe "#call" do
    subject { printer.call }

    it "prints the line" do
      expect(subject).to eq "#{path} #{count} visits"
    end
  end
end
