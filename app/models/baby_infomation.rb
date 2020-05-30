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
class BabyInfomation < ApplicationRecord
  belongs_to :parent

  enum sex: { 
    man: 0,
    woman: 1
  }

  enum experience_year:{ 
    less_than_one_year: 0,
    one_to_less_than_two: 1,
    two_to_less_than_three: 2,
    three_to_less_than_four: 3,
    four_to_less_than_five: 4,
    over_five_year: 5,
  }
end
