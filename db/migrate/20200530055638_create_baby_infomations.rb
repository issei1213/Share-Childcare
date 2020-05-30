class CreateBabyInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :baby_infomations do |t|
      t.references :parent, foreign_key: true
      t.string :name
      t.integer :age
      t.integer :sex
      t.timestamps
    end
  end
end
