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
class Babysitter < ApplicationRecord
  belongs_to :user
  has_many :babysitter_images
  accepts_nested_attributes_for :babysitter_images, allow_destroy: true
  has_many :orders

  enum experience_year:{ less_than_one_year: 0, one_to_less_than_two: 1, two_to_less_than_three: 2, three_to_less_than_four: 3, four_to_less_than_five: 4, over_five_year: 5 }

  validates :baby_age_range_down_month, :baby_age_range_down_year, :baby_age_range_top_month, :baby_age_range_top_year, :introduction_content, :introduction_title, :money_hour, :money_option, :profile_receiving_time_down, :profile_receiving_time_top, :number_of_baby, :experience_year, :profile_license, presence: true



end
