class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|
      t.references :user, foreign_key: true
      t.string :order_memo
      t.string :order_memo
      t.string :order_city
      t.integer :order_money_hour
      t.integer :order_money_option
      t.timestamps
    end
  end
end
