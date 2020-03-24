FactoryBot.define do
  factory :user do
    first_name              { Gimei.last.kanji }
    last_name               { Gimei.first.kanji }
    first_name_kana         { Gimei.name.last.hiragana }
    last_name_kana          { Gimei.name.first.hiragana  }
    nickname                { Gimei.last.romaji }
    postcode                { Faker::Address.postcode }
    prefecture              { Gimei.prefecture.kanji }
    city                    { Gimei.city.kanji }
    block                   { "1-1-1" }
    building                { "博多マンション" }
    email                   { Faker::Internet.email }
    phone_number            { Faker::PhoneNumber.cell_phone }
    password                { Faker::Lorem.characters(number:10, min_alpha:7) }
    password_confirmation   { password }
  end
end
