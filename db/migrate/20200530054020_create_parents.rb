class CreateParents < ActiveRecord::Migration[5.2]
  def change
    create_table :parents do |t|

      t.timestamps
    end
  end
end
