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
require 'rails_helper'

RSpec.describe Order, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      order = build(:order)
      order.valid?
      expect(order).to be_valid
    end
  end

  context "can not save" do
    it "dateが空では登録できないこと" do
      order = build(:order, date: "")
      order.valid?
      expect(order.errors[:date]).to include("を入力してください") 
    end

    it "hour_downが空では登録できないこと" do
      order = build(:order, hour_down: "")
      order.valid?
      expect(order.errors[:hour_down]).to include("を入力してください") 
    end
    it "hour_topが空では登録できないこと" do
      order = build(:order, hour_top: "")
      order.valid?
      expect(order.errors[:hour_top]).to include("を入力してください") 
    end
    it "money_hourが空では登録できないこと" do
      order = build(:order, money_hour: "")
      order.valid?
      expect(order.errors[:money_hour]).to include("を入力してください") 
    end
    it "money_optionが空では登録できないこと" do
      order = build(:order, money_option: "")
      order.valid?
      expect(order.errors[:money_option]).to include("を入力してください") 
    end
    it "monthが空では登録できないこと" do
      order = build(:order, month: "")
      order.valid?
      expect(order.errors[:month]).to include("を入力してください") 
    end
    it "statusが空では登録できないこと" do
      order = build(:order, status: "")
      order.valid?
      expect(order.errors[:status]).to include("を入力してください") 
    end
    it "yearが空では登録できないこと" do
      order = build(:order, year: "")
      order.valid?
      expect(order.errors[:year]).to include("を入力してください") 
    end
    
  end
end
