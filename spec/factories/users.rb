FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"sampl" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {person.first.kanji}
    last_name             {person.last.kanji}
    kana_first_name       {person.first.katakana}
    kana_last_name        {person.last.katakana}
    birthday              {Faker::Date.backward}
  end
end
