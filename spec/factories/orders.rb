# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  date          :integer          not null
#  hour_down     :integer          not null
#  hour_top      :integer          not null
#  memo          :string(255)
#  money_hour    :integer          not null
#  money_option  :integer          not null
#  month         :integer          not null
#  status        :integer          not null
#  year          :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  babysitter_id :bigint
#  parent_id     :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_orders_on_babysitter_id  (babysitter_id)
#  index_orders_on_parent_id      (parent_id)
#  index_orders_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (babysitter_id => babysitters.id)
#  fk_rails_...  (parent_id => parents.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order do
    date          { Faker::Number.between(from: 2000, to: 2038) }
    hour_down     { Faker::Number.between(from: 1, to: 24) }
    hour_top      { Faker::Number.between(from: 1, to: 24) }
    memo          { "テストメモ"}
    money_hour    { Faker::Number.between(from: 1, to: 99999) }
    money_option  { Faker::Number.between(from: 1, to: 99999) }
    month         { Faker::Number.between(from: 1, to: 12) }
    status        { Faker::Number.between(from: 1, to: 3) }
    year          { "orderd" }
    babysitter
    parent
    user
    
  end
end
