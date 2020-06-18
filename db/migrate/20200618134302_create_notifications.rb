class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :babysitter_id,     null: false
      t.integer :parent_id,         null: false
      t.integer :post_id
      t.integer :comment_id
      t.string  :action,            default: '', null: false
      t.boolean :checked,           default: false, null: false

      t.timestamps
    end

    add_index :notifications, :babysitter_id
    add_index :notifications, :parent_id
    add_index :notifications, :post_id
    add_index :notifications, :comment_id

  end
end
