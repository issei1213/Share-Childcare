# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string(255)      default(""), not null
#  checked    :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint
#  order_id   :bigint
#  visited_id :bigint           not null
#  visitor_id :bigint           not null
#
# Indexes
#
#  index_notifications_on_chat_id     (chat_id)
#  index_notifications_on_order_id    (order_id)
#  index_notifications_on_visited_id  (visited_id)
#  index_notifications_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (visited_id => users.id)
#  fk_rails_...  (visitor_id => users.id)
#
FactoryBot.define do
  factory :notification do
    
  end
end
