class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true, null: false
      t.references :order, foreign_key: true, null: false
      t.string     :comment, null: false
      t.timestamps
    end
  end
end
