class AddTotalOrdersFieldsToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :sell_orders, :string
    add_column :exchanges, :buy_orders, :string
  end
end
