class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders,  :user,         foreign_key: true
    add_reference :orders,  :babysitters,  foreign_key: true
    add_reference :orders,  :parents,      foreign_key: true
    add_column    :orders,  :status,       :integer
    add_column    :orders,  :year,         :integer
    add_column    :orders,  :month,        :integer
    add_column    :orders,  :date,         :integer
    add_column    :orders,  :hour_top,     :integer
    add_column    :orders,  :minute_top,   :integer
    add_column    :orders,  :hour_down,    :integer
    add_column    :orders,  :minute_down,  :integer
    add_column    :orders,  :memo,         :string
    add_column    :orders,  :prefecture,   :string
    add_column    :orders,  :city,         :string
    add_column    :orders,  :money_hour,   :integer
    add_column    :orders,  :money_option, :integer
  end
end
