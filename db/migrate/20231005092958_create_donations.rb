class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :charity, null: false, foreign_key: true
      t.decimal :amount
      t.boolean :recurring
      t.boolean :anonymous

      t.timestamps
    end
  end
end
