FactoryGirl.define do
  factory :showback_rate do
    sequence(:variable_cost)   { |n| Money.new(n, 'EUR') }
    fixed_cost                 Money.new(4.01, 'EUR')
    date                       DateTime.current
    sequence(:concept)         { |n| "Concept #{n}" }
  end
end
