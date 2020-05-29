class BabysitterAddDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :babysitters, :number_of_baby, :integer, default: 0
    change_column :babysitters, :babysitter_year, :integer, default: 0
    change_column :babysitters, :experience_support_count, :integer, default: 0
    change_column :babysitters, :experience_user_count, :integer, default: 0
  end
end
