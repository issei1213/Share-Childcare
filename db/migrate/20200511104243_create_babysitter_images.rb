class CreateBabysitterImages < ActiveRecord::Migration[5.2]
  def change
    create_table :babysitter_images do |t|
      t.string :name
      t.references :babysitter, foreign_key: true
      t.timestamps
    end
  end
end
