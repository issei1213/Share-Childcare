# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  block                  :string(255)      not null
#  building               :string(255)      not null
#  city                   :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)      not null
#  first_name_kana        :string(255)      not null
#  last_name              :string(255)      not null
#  last_name_kana         :string(255)      not null
#  nickname               :string(255)      not null
#  phone_number           :string(255)      not null
#  postcode               :string(255)      not null
#  prefecture             :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
