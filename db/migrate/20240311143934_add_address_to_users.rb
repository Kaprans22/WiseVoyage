class AddAddressToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :text
  end
end
