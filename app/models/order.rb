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
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :parent
  belongs_to :babysitter

  enum status: { orderd: 1, approved: 2 , canceld: 3}
end
