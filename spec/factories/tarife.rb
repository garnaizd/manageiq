FactoryGirl.define do
  factory :tarife do
    sequence(:id_tarife)        { |s| s }
    variable_cost               Money.new(0.01, 'EUR')
    fixed_cost                  Money.new(0.010, 'EUR')
    array_rates					["cpu_usage", "cpu_usage_mhz"]
    sequence(:description)      { |s| "Description #{s}" }
  end
end
