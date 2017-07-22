class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.integer :ex_type
      t.string :last_price
      t.string :lowest_ask
      t.string :highest_bid
      t.string :percent_change
      t.string :base_volume
      t.string :quote_volume
      t.string :high24hr
      t.string :low24hr

      t.timestamps
    end
  end
end
