class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
      add_column :users, :email, :string
      add_column :users, :firstname, :string
      add_column :users, :secondname, :string
      add_column :users, :role, :string
      
  end
end
