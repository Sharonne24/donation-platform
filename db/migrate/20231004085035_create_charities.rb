class CreateCharities < ActiveRecord::Migration[7.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
