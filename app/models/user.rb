class User < ApplicationRecord
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
