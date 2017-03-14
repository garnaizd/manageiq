require 'rails_helper'

RSpec.describe ShowbackRate, type: :model do
  context "validations" do
    let(:showback_rate) { FactoryGirl.build(:showback_rate) }

    it "has a valid factory" do
      expect(showback_rate).to be_valid
    end

    it "should ensure presence of fixed_cost" do
      showback_rate.fixed_cost = nil
      showback_rate.valid?
      expect(showback_rate.errors[:fixed_cost]).to include "fixed_cost must be instance of Money"
    end

    it "should ensure presence of variable_cost" do
      showback_rate.variable_cost = nil
      showback_rate.valid?
      expect(showback_rate.errors[:variable_cost]).to include "variable_cost must be instance of Money"
    end

    it "should ensure presence of concept" do
      showback_rate.concept = nil
      showback_rate.valid?
      expect(showback_rate.errors[:concept]).to include "can't be blank"
    end

    it "should ensure that variable_cost is instance of Money" do
      showback_rate_fail = FactoryGirl.create(:showback_rate, :variable_cost => 2)
      showback_rate_fail.valid?
      expect(showback_rate_fail.errors[:variable_cost]).to include "variable_cost must be instance of Money"
    end
  end
end
