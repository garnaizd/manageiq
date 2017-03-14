require 'rails_helper'

RSpec.describe ShowbackRate, type: :model do
  context "validations" do
    let(:showback_rate) { FactoryGirl.build(:showback_rate) }

    it "has a valid factory" do
      expect(showback_rate).to be_valid
    end
    it "should ensure presence of rating" do
      showback_rate.rating = nil
      showback_rate.valid?
      expect(showback_rate.errors[:rating]).to include "can't be blank"
    end

    it "should ensure presence of concept" do
      showback_rate.concept = nil
      showback_rate.valid?
      expect(showback_rate.errors[:concept]).to include "can't be blank"
    end

    it "should ensure presence of measure type" do
      showback_rate_fail = FactoryGirl.create(:showback_rate, :rating => 2)
      showback_rate_fail.valid?
      expect(showback_rate_fail.errors[:rating]).to include "Rating must be instance of Money"
    end
  end
end
