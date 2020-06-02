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
FactoryBot.define do
  factory :babysitter_image do
    name { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.png")) }
    babysitter
  end
end
