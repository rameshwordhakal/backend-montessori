class AddFieldsToChildTable < ActiveRecord::Migration[5.1]
  def change
        add_column :children, :fathers_name, :string
        add_column :children, :mothers_name, :string
  end
end
