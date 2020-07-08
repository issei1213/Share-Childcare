# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  block                  :string(255)      not null
#  building               :string(255)      not null
#  city                   :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)      not null
#  first_name_kana        :string(255)      not null
#  last_name              :string(255)      not null
#  last_name_kana         :string(255)      not null
#  nickname               :string(255)      not null
#  phone_number           :string(255)      not null
#  postcode               :string(255)      not null
#  prefecture             :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  has_one :babysitter
  has_one :parent
  has_many :orders
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  VALID_PHONE_NUMBER_REGEX = /0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/

  validates :first_name, :last_name, presence: true, format: {with: VALID_ZENKAKU_REGEX}
  validates :first_name_kana, :last_name_kana, presence: true, format: {with: VALID_KANA_REGEX}
  validates :email, uniqueness: true, presence: true, format:  { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX}
  validates :postcode,:prefecture, :city, :block, :building, presence: true
  validates :nickname, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 7 }

end
