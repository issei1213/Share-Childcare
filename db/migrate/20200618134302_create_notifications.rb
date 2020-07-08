class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :visitor, foreign_key:{ to_table: :users }, null: false
      t.references :visited, foreign_key:{ to_table: :users }, null: false
      t.references :order, foreign_key: true
      t.string  :action, default: '', null: false
      t.timestamps
      t.boolean :checked, null: false, default: false
    end

  end
end
