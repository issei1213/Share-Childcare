class CreateBabyInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :baby_infomations do |t|

      t.timestamps
    end
  end
end
