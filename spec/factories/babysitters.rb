# == Schema Information
#
# Table name: babysitters
#
#  id                          :bigint           not null, primary key
#  baby_age_range_down_month   :integer
#  baby_age_range_down_year    :integer
#  baby_age_range_top_month    :integer
#  baby_age_range_top_year     :integer
#  babysitter_year             :integer          default(0)
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
    user { "" }
    baby_age_range_top_year { "" }
    baby_age_range_down_year { 1 }
    baby_age_range_down_month { 1 }
    number_of_babies { 1 }
    babysitter_year { 1 }
  end
end
