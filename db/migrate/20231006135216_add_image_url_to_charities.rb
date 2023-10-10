class AddImageUrlToCharities < ActiveRecord::Migration[7.0]
  def change
    add_column :charities, :image_url, :string
  end
end
