require "spec_helper"
require "./src/sorting/by_views"

RSpec.describe Sorting::ByViews do
  let(:machine) { described_class.new(resources: resources) }
  let(:resources) do
    {
      path_0 => counter_0,
      path_1 => counter_1
    }
  end
  let(:counter_0) { { count: 0 } }
  let(:counter_1) { { count: 1 } }
  let(:path_0) { "path/" }
  let(:path_1) { "another_path/" }

  describe "#call" do
    subject { machine.call }
    let(:expected) do
      [
        "#{path_1} #{counter_1[:count]} visits",
        "#{path_0} #{counter_0[:count]} visits"
      ]
    end

    it "array of printed results" do
      expect(subject).to eq expected
    end
  end
end
