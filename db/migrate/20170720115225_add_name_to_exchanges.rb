class AddNameToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :name, :string
  end
end
