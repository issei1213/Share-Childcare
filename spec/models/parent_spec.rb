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
require 'rails_helper'

RSpec.describe Parent, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      parent = build(:parent)
      parent.valid?
      expect(parent).to be_valid
    end
  end

  context "can not save" do
    it "都道府県が空では登録できない事" do
      parent = build(:parent order_prefecture: "")
      parent.valid?
      expect(parent.errors[:order_prefecture]).to include("を入力してください")
    end

    it "市区町村が空では登録できない事" do
      parent = build(:parent order_city: "")
      parent.valid?
      expect(parent.errors[:order_city]).to include("を入力してください")
    end

    it "希望時給が空では登録できない事" do
      parent = build(:parent order_money_hour: "")
      parent.valid?
      expect(parent.errors[:order_money_hour]).to include("を入力してください")
    end
  end
end
