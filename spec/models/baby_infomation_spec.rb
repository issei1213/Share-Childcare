# == Schema Information
#
# Table name: baby_infomations
#
#  id         :bigint           not null, primary key
#  age        :integer
#  name       :string(255)
#  sex        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#
# Indexes
#
#  index_baby_infomations_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => parents.id)
#
require 'rails_helper'

RSpec.describe BabyInfomation, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      baby_infomation = build(:baby_infomation)
      baby_infomation.valid?
      expect(baby_infomation).to be_valid
    end
  end

  context "can not save" do
    it "性別が空では登録ができない事" do
      baby_infomation = build(:baby_infomation, sex: "")
      baby_infomation.valid?
      expect(baby_infomation.errors[:sex]).to include("を入力してください")
    end

    it "名前が空では登録ができない事" do
      baby_infomation = build(:baby_infomation, name: "")
      baby_infomation.valid?
      expect(baby_infomation.errors[:name]).to include("を入力してください")
    end

    it "年齢が空では登録ができない事" do
      baby_infomation = build(:baby_infomation, age: "")
      baby_infomation.valid?
      expect(baby_infomation.errors[:age]).to include("を入力してください")
    end
  end
end
