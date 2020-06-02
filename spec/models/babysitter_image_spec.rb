# == Schema Information
#
# Table name: babysitter_images
#
#  id            :bigint           not null, primary key
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  babysitter_id :bigint
#
# Indexes
#
#  index_babysitter_images_on_babysitter_id  (babysitter_id)
#
# Foreign Keys
#
#  fk_rails_...  (babysitter_id => babysitters.id)
#
require 'rails_helper'

RSpec.describe BabysitterImage, type: :model do
  context "can save" do
    it "画像が登録できること" do
      babysitter_image = build(:babysitter_image)
      babysitter_image.valid?
      expect(babysitter_image).to be_valid
    end
  end

  context "can not save" do
    it "画像無しで登録できないこと" do
      babysitter_image = build(:babysitter_image, name: "")
      babysitter_image.valid?
      expect(babysitter_image).to include("を入力してください")
    end
  end
end
