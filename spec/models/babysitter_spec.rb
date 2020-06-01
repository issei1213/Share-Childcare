# == Schema Information
#
# Table name: babysitters
#
#  id                          :bigint           not null, primary key
#  baby_age_range_down_month   :integer
#  baby_age_range_down_year    :integer
#  baby_age_range_top_month    :integer
#  baby_age_range_top_year     :integer
#  experience_support_count    :integer          default(0)
#  experience_user_count       :integer          default(0)
#  experience_year             :integer
#  introduction_content        :string(255)
#  introduction_title          :string(255)
#  money_hour                  :integer
#  money_option                :integer
#  number_of_baby              :integer          default(0)
#  profile_license             :string(255)
#  profile_receiving_time_down :integer
#  profile_receiving_time_top  :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  user_id                     :bigint
#
# Indexes
#
#  index_babysitters_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Babysitter, type: :model do
  context "can save" do
    it "全カラムが存在すれば登録できる事" do
      babysitter = build(:babysitter)
      babysitter.valid?
      expect(babysitter).to be_valid
    end
  end
  context "can not save" do
    it "baby_age_range_down_monthが空では登録できないこと" do
      babysitter = build(:babysitter, baby_age_range_down_month: "")
      babysitter.valid?
      expect(babysitter.errors[:baby_age_range_down_month]).to include("を入力してください")
    end

    it "baby_age_range_down_yearが空では登録できないこと" do
      babysitter = build(:babysitter, baby_age_range_down_year: "")
      babysitter.valid?
      expect(babysitter.errors[:baby_age_range_down_year]).to include("を入力してください")
    end

    it "baby_age_range_top_monthが空では登録できないこと" do
      babysitter = build(:babysitter, baby_age_range_top_month: "")
      babysitter.valid?
      expect(babysitter.errors[:baby_age_range_top_month]).to include("を入力してください")
    end

    it "baby_age_range_top_yearが空では登録できないこと" do
      babysitter = build(:babysitter, baby_age_range_top_year: "")
      babysitter.valid?
      expect(babysitter.errors[:baby_age_range_top_year]).to include("を入力してください")
    end

    it "experience_yearが空では登録できないこと" do
      babysitter = build(:babysitter, experience_year: "")
      babysitter.valid?
      expect(babysitter.errors[:experience_year]).to include("を入力してください")
    end

    it "introduction_contentが空では登録できないこと" do
      babysitter = build(:babysitter, introduction_content: "")
      babysitter.valid?
      expect(babysitter.errors[:introduction_content]).to include("を入力してください")
    end

    it "introduction_titleが空では登録できないこと" do
      babysitter = build(:babysitter, introduction_title: "")
      babysitter.valid?
      expect(babysitter.errors[:introduction_title]).to include("を入力してください")
    end

    it "money_hour" do
      babysitter = build(:babysitter, money_hour: "")
      babysitter.valid?
      expect(babysitter.errors[:money_hour]).to include("を入力してください")
    end

    it "money_option" do
      babysitter = build(:babysitter, money_option: "")
      babysitter.valid?
      expect(babysitter.errors[:money_option]).to include("を入力してください")
    end

    it "profile_license" do
      babysitter = build(:babysitter, profile_license: "")
      babysitter.valid?
      expect(babysitter.errors[:profile_license]).to include("を入力してください")
    end

    it "profile_receiving_time_down" do
      babysitter = build(:babysitter, profile_receiving_time_down: "")
      babysitter.valid?
      expect(babysitter.errors[:profile_receiving_time_down]).to include("を入力してください")
    end

    it "profile_receiving_time_top" do
      babysitter = build(:babysitter, profile_receiving_time_top: "")
      babysitter.valid?
      expect(babysitter.errors[:profile_receiving_time_top]).to include("を入力してください")
    end

  end
end
