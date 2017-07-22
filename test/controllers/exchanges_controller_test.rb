require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange = exchanges(:one)
  end

  test "should get index" do
    get exchanges_url
    assert_response :success
  end

  test "should get new" do
    get new_exchange_url
    assert_response :success
  end

  test "should create exchange" do
    assert_difference('Exchange.count') do
      post exchanges_url, params: { exchange: { base_volume: @exchange.base_volume, ex_type: @exchange.ex_type, high24hr: @exchange.high24hr, highest_bid: @exchange.highest_bid, last_price: @exchange.last_price, low24hr: @exchange.low24hr, lowest_ask: @exchange.lowest_ask, percent_change: @exchange.percent_change, quote_volume: @exchange.quote_volume } }
    end

    assert_redirected_to exchange_url(Exchange.last)
  end

  test "should show exchange" do
    get exchange_url(@exchange)
    assert_response :success
  end

  test "should get edit" do
    get edit_exchange_url(@exchange)
    assert_response :success
  end

  test "should update exchange" do
    patch exchange_url(@exchange), params: { exchange: { base_volume: @exchange.base_volume, ex_type: @exchange.ex_type, high24hr: @exchange.high24hr, highest_bid: @exchange.highest_bid, last_price: @exchange.last_price, low24hr: @exchange.low24hr, lowest_ask: @exchange.lowest_ask, percent_change: @exchange.percent_change, quote_volume: @exchange.quote_volume } }
    assert_redirected_to exchange_url(@exchange)
  end

  test "should destroy exchange" do
    assert_difference('Exchange.count', -1) do
      delete exchange_url(@exchange)
    end

    assert_redirected_to exchanges_url
  end
end
