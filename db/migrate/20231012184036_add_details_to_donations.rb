class AddDetailsToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :paypal_response, :jsonb, default: {}
    add_column :donations, :paypal_transaction_response, :jsonb, default: {}
    add_column :donations, :redirect_url, :string
  end
end
