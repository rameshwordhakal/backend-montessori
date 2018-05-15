class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string :name
      t.string :gender
      t.date :dob
      t.date :joined_date
      t.integer :user_id

      t.timestamps
    end
  end
end
