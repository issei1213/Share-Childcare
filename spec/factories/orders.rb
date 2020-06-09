# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  date           :integer          not null
#  hour_down      :integer          not null
#  hour_top       :integer          not null
#  memo           :string(255)
#  money_hour     :integer          not null
#  money_option   :integer          not null
#  month          :integer          not null
#  status         :integer          not null
#  year           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  babysitters_id :bigint
#  parents_id     :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_orders_on_babysitters_id  (babysitters_id)
#  index_orders_on_parents_id      (parents_id)
#  index_orders_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (babysitters_id => babysitters.id)
#  fk_rails_...  (parents_id => parents.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order do
    
  end
end
