class AddCountInBtcToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :count_in_btc, :float
  end
end
