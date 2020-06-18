# == Schema Information
#
# Table name: notifications
#
#  id            :bigint           not null, primary key
#  action        :string(255)      default(""), not null
#  checked       :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  babysitter_id :integer          not null
#  comment_id    :integer
#  parent_id     :integer          not null
#  post_id       :integer
#
# Indexes
#
#  index_notifications_on_babysitter_id  (babysitter_id)
#  index_notifications_on_comment_id     (comment_id)
#  index_notifications_on_parent_id      (parent_id)
#  index_notifications_on_post_id        (post_id)
#
class Notification < ApplicationRecord
end
