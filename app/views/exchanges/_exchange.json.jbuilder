json.extract! exchange, :id, :ex_type, :last_price, :lowest_ask, :highest_bid, :percent_change, :base_volume, :quote_volume, :high24hr, :low24hr, :created_at, :updated_at
json.url exchange_url(exchange, format: :json)
