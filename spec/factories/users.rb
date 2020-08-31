FactoryBot.define do
  factory :user do  

    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Internet.username}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.last.kanji}
    first_name            {person.first.kanji}
    family_name_cana      {person.last.katakana}
    first_name_cana       {person.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end