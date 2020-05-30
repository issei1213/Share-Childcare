class ParentAddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :parents, :order_prefecture, :string
  end
end
