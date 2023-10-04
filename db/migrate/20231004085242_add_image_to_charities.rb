class AddImageToCharities < ActiveRecord::Migration[7.0]
  def change
    add_reference :charities, :image, null: false, foreign_key: true
  end
end
