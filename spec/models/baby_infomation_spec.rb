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
  context "全カラムが存在すれば登録できる事" do
    baby_infomation = build(:baby_infomation)
    baby_infomation.valid?
    expect(baby_infomation).to be_valid
  end
end
