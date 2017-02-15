require "rails_helper"

RSpec.describe Absence, type: :model do
  subject { Absence.new }

  it { is_expected.to respond_to(:days) }
  it { is_expected.to respond_to(:type) }
  it { is_expected.to respond_to(:status) }

  describe "#cal_days" do
    let(:absence) { Absence.new(start: started_at, end: ended_at) }

    context "when start date is half day" do
      let(:started_at) { Time.parse("2017-03-20 12:00") }
      let(:ended_at) { Time.parse("2017-03-29 23:59") }

      it "calculates the days correctly" do
        expect(absence.cal_days).to eq(7.5)
      end
    end

    context "when start date is all day" do
      let(:started_at) { Time.parse("2017-03-20 00:00") }
      let(:ended_at) { Time.parse("2017-03-29 23:59") }

      it "calculates the days correctly" do
        expect(absence.cal_days).to eq(8)
      end
    end

    context "when end date is weekend" do
      let(:started_at) { Time.parse("2017-03-20 00:00") }
      let(:ended_at) { Time.parse("2017-03-26 23:59") }

      it "calculates the days correctly" do
        expect(absence.cal_days).to eq(5)
      end
    end
  end
end
