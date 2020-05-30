# == Schema Information
#
# Table name: parents
#
#  id                 :bigint           not null, primary key
#  order_city         :string(255)
#  order_memo         :string(255)
#  order_money_hour   :integer
#  order_money_option :integer
#  order_prefecture   :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_parents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Parent < ApplicationRecord
  belongs_to :user
  has_many :baby_infomations


end
