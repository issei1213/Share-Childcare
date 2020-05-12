class CreateBabysitters < ActiveRecord::Migration[5.2]
  def change
    create_table :babysitters do |t|
      t.references :user, foreign_key: true
      t.integer :baby_age_range_top_month 
      t.integer :baby_age_range_top_year
      t.integer :baby_age_range_down_year
      t.integer :baby_age_range_down_month
      t.integer :number_of_baby
      t.integer :babysitter_year
      t.integer :experience_year
      t.integer :experience_support_count
      t.integer :experience_user_count
      t.string :introduction_title
      t.string :introduction_content 
      t.integer :money_hour
      t.integer :money_option
      t.string :profile_license
      t.integer :profile_receiving_time_top
      t.integer :profile_receiving_time_down

      t.timestamps
    end
  end
end
