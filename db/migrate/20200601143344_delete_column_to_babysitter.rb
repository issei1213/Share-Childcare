class DeleteColumnToBabysitter < ActiveRecord::Migration[5.2]
  def change
    remove_column :babysitters, :babysitter_year, :integer
  end
end
