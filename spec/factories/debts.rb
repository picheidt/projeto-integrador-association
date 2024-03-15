FactoryBot.define do
  factory :debt do
    person
    amount { Faker::Number.decimal(l_digits: 2) }
    observation { Faker::Lorem.sentence }
  end
end
