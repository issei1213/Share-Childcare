class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders,  :user,         foreign_key: true
    add_reference :orders,  :babysitters,  foreign_key: true
    add_reference :orders,  :parents,      foreign_key: true
    add_column    :orders,  :status,       :integer,          null: false
    add_column    :orders,  :year,         :integer,          null: false
    add_column    :orders,  :month,        :integer,          null: false
    add_column    :orders,  :date,         :integer,          null: false
    add_column    :orders,  :hour_top,     :integer,          null: false
    add_column    :orders,  :hour_down,    :integer,          null: false
    add_column    :orders,  :memo,         :string
    add_column    :orders,  :prefecture,   :string,           null: false
    add_column    :orders,  :city,         :string,           null: false
    add_column    :orders,  :money_hour,   :integer,          null: false
    add_column    :orders,  :money_option, :integer,          null: false
  end
end
