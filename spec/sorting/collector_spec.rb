require "spec_helper"
require "./src/sorting/collector"

RSpec.describe Sorting::Collector do
  let(:collector) { described_class.new }
  subject { collector.accept_resource(path: path, ip_number: ip_number) }
  let(:path) { "/path" }
  let(:ip_number) { "123.213.124.2111"}

  describe "#resources" do
    subject { collector.resources }

    it "returns resources" do
      collector.accept_resource(path: path, ip_number: ip_number)
      expect(subject).to eq( { path => { count: 1, uniq_count: 1, uniq_numbers: [ip_number] } } )
    end
  end

  describe "#accept_resourse" do
    context "when path occurs first time" do
      it "creates a note and path score" do
        expect(subject).to eq ({ count: 1, uniq_count: 1, uniq_numbers: [ip_number] })
      end

      context "when path already registered with same number" do
        it "remembers and returns path score" do
          collector.accept_resource(path: path, ip_number: ip_number)
          expect(subject).to eq ( { count: 2, uniq_count: 1, uniq_numbers: [ip_number] } )
        end
      end

      context "when path already registered with different number" do
        let(:different_number) { "123.123.234.345"}

        it "remembers and returns path score" do
          collector.accept_resource(path: path, ip_number: different_number)
          expect(subject).to eq ( { count: 2, uniq_count: 2, uniq_numbers: [different_number, ip_number] } )
        end
      end
    end
  end
end
