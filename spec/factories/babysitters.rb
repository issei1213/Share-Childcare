# == Schema Information
#
# Table name: babysitters
#
#  id                          :bigint           not null, primary key
#  baby_age_range_down_month   :integer
#  baby_age_range_down_year    :integer
#  baby_age_range_top_month    :integer
#  baby_age_range_top_year     :integer
#  experience_support_count    :integer          default(0)
#  experience_user_count       :integer          default(0)
#  experience_year             :integer
#  introduction_content        :string(255)
#  introduction_title          :string(255)
#  money_hour                  :integer
#  money_option                :integer
#  number_of_baby              :integer          default(0)
#  profile_license             :string(255)
#  profile_receiving_time_down :integer
#  profile_receiving_time_top  :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  user_id                     :bigint
#
# Indexes
#
#  index_babysitters_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :babysitter do
    user                        
    baby_age_range_top_year     { Faker::Number.between(from: 0, to: 6) }
    baby_age_range_top_month    { Faker::Number.between(from: 1, to: 12) }
    baby_age_range_down_year    { Faker::Number.between(from: 0, to: 6) }
    baby_age_range_down_month   { Faker::Number.between(from: 1, to: 12) }
    experience_support_count    { Faker::Number.between(from: 1, to: 6) }
    experience_user_count       { Faker::Number.between(from: 1, to: 9) }
    experience_year             { "less_than_one_year" }
    introduction_content        { "テスト本文" }
    introduction_title          { "テストタイトル" }
    money_hour                  { Faker::Number.number(digits: 4) }
    money_option                { Faker::Number.number(digits: 4) }
    number_of_baby              { Faker::Number.between(from: 1, to: 9) }
    profile_license             { "保育士" }
    profile_receiving_time_down { Faker::Number.between(from: 1, to: 24) }
    profile_receiving_time_top  { Faker::Number.between(from: 1, to: 24) }
  end
end
