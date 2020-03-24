class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/

  validates :first_name, :last_name, presence: true,format: {with: VALID_ZENKAKU_REGEX}
  validates :first_name_kana, :last_name_kana, presence: true,format: {with: VALID_KANA_REGEX}
  validates :nickname,:postcode,:prefecture, :city, :block, :building, :phone_number, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 7 }
  validates :email, uniqueness: true, format:  { with: VALID_EMAIL_REGEX }

end
