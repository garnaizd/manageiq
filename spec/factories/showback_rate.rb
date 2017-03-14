FactoryGirl.define do
  factory :showback_rate do
    rating                Money.new(14.01, 'EUR')
    date                  DateTime.current
    sequence(:concept)    { |n| "Concept #{n}"}
  end
end
