FactoryGirl.define do
  factory :tariff do
    variable_cost               Money.new(0.01, 'EUR')
    fixed_cost                  Money.new(0.010, 'EUR')
    sequence(:description)      { |s| "Description #{s}" }
  end
end
