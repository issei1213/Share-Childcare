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
class ::Order < ApplicationRecord
  belongs_to :user
  belongs_to :parent
  belongs_to :babysitter
  has_many :notifications, dependent: :destroy
  has_many :chats, dependent: :destroy

  validates :date, :hour_down, :hour_top, :month, :status, :year, :money_hour, :money_option, presence: true

  enum status: { ordered: 1, approved: 2 , canceled: 3}

  # 通知メソッド(create/update)
  def notification_order!(action, current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and order_id = ? and action = ? ", parent_id, babysitter_id, id, action])
    if temp.blank?
      notification = current_user.active_notifications.new(order_id: id, visited_id: babysitter.user_id, action: action)
      if notification.visitor_id == notification.visited_id
        notification.checked = true 
      end
      notification.save if notification.valid?
    end
  end

  # 通知メソッド(approve/cancel)
  def notification_order_answer!(action, current_user)
      visitor_user = current_user.active_notifications.new(order_id: id, visited_id: parent.user_id, action: action)
      visited_user = current_user.passive_notifications.new(order_id: id, visitor_id: parent.user_id, action: action)

      visitor_user.save if visitor_user.valid?
      visited_user.save if visited_user.valid?
  end

  # 既読メソッド
  def update_notification_checked!(notification)
    notification.update({ checked: true }) if notification.where(checked: false)
  end

  # def save_notification_checked!(current_user)
  #   chats = Order.find(self.id).chats
  #   chats.each do |chat|
  #     # notification = Notification.where(visitor_id: current_user.id, chat_id: chat.id, action: "commented")
  #     notification = Notification.where("visitor_id = ? and chat_id = ? and action = ? ", current_user.id, chat.id, "commented")
  #     if notification.visitor_id == notification.visited_id
  #       notification.checked = true
  #     end
  #   end
  # end
end
