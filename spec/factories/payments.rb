FactoryBot.define do
  factory :payment do
    person
    amount { Faker::Number.between(from: 1, to: 200) }
    paid_at { Faker::Date.between(from: '2020-01-01', to: '2024-04-30') }
  end
end
