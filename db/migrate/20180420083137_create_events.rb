class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.datetime :date
      t.integer :user_id
      t.timestamps
    end
    
  end
end
