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
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true

  def create_notification_chat!(current_user, chat_id)
    temp_ids = Chat.select(:user_id).where(order_id: order_id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, id, temp_id['user_id'])
    end

    save_notification_comment!(current_user, id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, id, visited_id)
    notification = current_user.active_notifications.new(order_id: order_id, chat_id: id, visited_id: visited_id, action: 'commented')
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  # def self.save_notification_checked!(current_user, chats)
  #   notifications = Notification.where("visitor_id = ? and action = ? ", current_user.id, chat.id, "commented")

  #   chats.each do |chat|
  #     binding.pry
  #     if chat.blank?
  #       notification = ::Notification.find_by(chat_id: chat.id)
  #       notification.checked = true if notification.visitor_id == notification.visited_id
  #       notification.save if notification.valid?
  #     end
  #   end
  # end
end
