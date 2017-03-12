describe Tarife do
  before do
    @expected_tarife_count = 3
  end

  context "validations" do
    it "should ensure presence of id_rate" do
      expect(FactoryGirl.build(:tarife, :id_tarife => nil)).not_to be_valid
    end

    it "should ensure presence of variable_cost" do
      expect(FactoryGirl.build(:tarife, :variable_cost => nil)).not_to be_valid
    end

    it "should ensure presence of fixed_cost" do
      expect(FactoryGirl.build(:tarife, :fixed_cost => nil)).not_to be_valid
    end

    it "Should be variable_cost class money" do
      tarife = FactoryGirl.create(:tarife)
      expect(tarife.variable_cost.klass).to eq(Money)
    end

    it "should ensure presence of title" do
      expect(FactoryGirl.build(:tarife, :title => nil)).not_to be_valid
    end
  end

  context ".seed" do
    it "empty table" do
      Tarife.seed
      expect(Tarife.count).to eq(@expected_tarife_count)
    end

    it "run twice" do
      Tarife.seed
      Tarife.seed
      expect(Tarife.count).to eq(@expected_tarife_count)
    end

    it "with existing records" do
      unchanged = FactoryGirl.create(:tarife, :variable_cost => Money.new(0.335, 'EUR'))
      unchanged_orig_updated_at = unchanged.updated_at

      Tarife.seed

      expect(Tarife.count).to eq(@expected_tarife_count + 1)
    end
  end
end
