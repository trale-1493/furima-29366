FactoryBot.define do
  factory :product do
    name              { Faker::Lorem.word }
    value             { Faker::Number.between(from: 300, to: 9_999_999) }
    explain           { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    delivery_payer_id { Faker::Number.between(from: 2, to: 3) }
    region_id         { Faker::Number.between(from: 2, to: 48) }
    delivery_span_id  { Faker::Number.between(from: 2, to: 4) }
    association :user
  end
end
