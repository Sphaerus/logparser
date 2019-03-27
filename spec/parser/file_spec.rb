require "spec_helper"
require "./src/parser/file"

RSpec.describe Parser::File do
  let(:parser) { described_class.new(file) }
  let(:file) { File.open("./spec/lib/webserver.log") }

  describe "#call" do
    subject { parser.call }
    let(:expected) do
      {
        "/help_page/1" => {
          count: 5,
          uniq_count: 5,
          uniq_numbers: [
            "126.318.035.038",
             "929.398.951.889",
             "722.247.931.582",
             "646.865.545.408",
             "543.910.244.929"
          ]
        },
        "/contact" => {
          count: 3,
          uniq_count: 2,
          uniq_numbers: [
            "184.123.665.067",
            "543.910.244.929"
            ]
          },
          "/home" => {
            count: 3,
            uniq_count: 3,
            uniq_numbers: [
              "184.123.665.067",
              "235.313.352.950",
              "316.433.849.805"
            ]
          },
          "/about/2"=> {
            count: 2,
            uniq_count: 1,
            uniq_numbers: ["444.701.448.104"]
          },
          "/index" => {
            count: 1,
            uniq_count: 1,
            uniq_numbers: ["444.701.448.104"]
          },
          "/about" => {
            count: 1,
            uniq_count: 1,
            uniq_numbers: ["061.945.150.735"]
          }
        }
    end

    it "returns printed lines" do
      expect(subject).to eq(expected)
    end
  end
end
