# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  comment    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_chats_on_order_id  (order_id)
#  index_chats_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (user_id => users.id)
#
class Chat < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user

  # def create_notification_chat!(current_user, chat_id)
  #   # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
  #   temp_ids = Chat.select(:user_id).where(order_id: order_id).where.not(user_id: current_user.id).distinct
  #   binding.pry
  #   temp_ids.each do |temp_id|
  #     save_notification_comment!(current_user, comment_id, temp_id['user_id'])
  #   end
  #   # まだ誰もコメントしていない場合は、投稿者に通知を送る
  #   binding.pry
  #   save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  # end

  # def save_notification_comment!(current_user, comment_id, visited_id)
  #   # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
  #   notification = current_user.active_notifications.new(post_id: id, comment_id: comment_id, visited_id: visited_id, action: 'commented')
  #   # 自分の投稿に対するコメントの場合は、通知済みとする
  #   if notification.visitor_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save if notification.valid?
  # end
end
