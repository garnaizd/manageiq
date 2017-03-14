describe Tariff do
  before do
    @expected_tariff_count = 3
  end

  context "validations" do
    it "should ensure presence of variable_cost" do
      expect(FactoryGirl.build(:tariff, :variable_cost => nil)).not_to be_valid
    end

    it "should ensure presence of fixed_cost" do
      expect(FactoryGirl.build(:tariff, :fixed_cost => nil)).not_to be_valid
    end

    it "Should be variable_cost class money" do
      tariff = FactoryGirl.create(:tariff)
      expect(tariff.variable_cost.klass).to eq(Money)
    end

    it "should ensure presence of title" do
      expect(FactoryGirl.build(:tariff, :title => nil)).not_to be_valid
    end
  end

  context ".seed" do
    it "empty table" do
      Tariff.seed
      expect(Tariff.count).to eq(@expected_tariff_count)
    end

    it "run twice" do
      Tariff.seed
      Tariff.seed
      expect(Tariff.count).to eq(@expected_tariff_count)
    end

    it "with existing records" do
      FactoryGirl.create(:tariff, :variable_cost => Money.new(0.335, 'EUR'))

      Tariff.seed

      expect(Tariff.count).to eq(@expected_tariff_count + 1)
    end
  end
end
