# frozen_string_literal: true

RSpec.describe CompoundInterest do
  it "has a version number" do
    expect(CompoundInterest::VERSION).not_to be nil
  end
end

RSpec.describe CompoundInterest::Calculation do
  describe ".calculate" do
    context "not a Hash given " do
      it "raises error" do
        expect { CompoundInterest::Calculation.calculate(1) }.to raise_error(RuntimeError)
      end
    end
    it "work with all options" do
      expect(CompoundInterest::Calculation.calculate({
                                                       initial_payment: 100,
                                                       term: 2,
                                                       capitalization_periodicity: 12,
                                                       interest_rate: 10.0,
                                                       payment: 100,
                                                       payment_periodicity: 12
                                                     })).to eq(2650.9774034389)
    end
    it "work without :payment" do
      expect(CompoundInterest::Calculation.calculate({
                                                       initial_payment: 100,
                                                       term: 2,
                                                       capitalization_periodicity: 12,
                                                       interest_rate: 10
                                                     })).to eq(122.03909613755593)
    end
  end
end
