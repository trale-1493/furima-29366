FactoryBot.define do
  factory :purchase_address do
    transient do
      address { Gimei.address }
    end


    postal_code       { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    region_id         { Faker::Number.between(from: 2, to: 48) }
    city              { address.city.to_s }
    city_number       { "#{Faker::Number.between(from: 1, to: 99)}-#{Faker::Number.between(from: 1, to: 99)}-#{Faker::Number.between(from: 1, to: 99)}"}
    building          
    telephone_number  { Faker::Number.number(digits: 11) }
    association :purchase
  end
end
