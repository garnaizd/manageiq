class ShowbackRate < ApplicationRecord
  validates :fixed_cost,                                       :presence => true
  validates :variable_cost,                                    :presence => true
  validates :concept,                                          :presence => true
  validates :check_type_fixed_cost, :check_type_variable_cost, :on       => :create

  def check_type_fixed_cost
    errors.add(:fixed_cost, "fixed_cost must be instance of Money") unless :fixed_cost.instance_of? Money
  end

  def check_type_variable_cost
    errors.add(:variable_cost, "variable_cost must be instance of Money") unless :variable_cost.instance_of? Money
  end
end
