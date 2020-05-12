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
  pending "add some examples to (or delete) #{__FILE__}"
end
