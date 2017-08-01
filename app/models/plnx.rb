require 'httparty'
require 'json'
require 'watir'
require 'nokogiri'
require 'benchmark'
class Plnx
  API_URL = 'https://poloniex.com/public?command=returnTicker'.freeze
  WEB_URL = 'https://poloniex.com/exchange#'.freeze

  def initialize
    @data = load_data
  end

  def load_data
    response = HTTParty.get(API_URL)
    data = JSON.parse(response.body)
    data.delete_if { |key, _value| Exchange.ex_types.keys.exclude? key }
  end

  def create_exchanges
    threads = []
    @data.each_slice(30) do |e|
      new_h = Hash[e]
      threads << Thread.new do
        new_h.each do |key, value|
          web_url = WEB_URL + key
          browser = Watir::Browser.new(:phantomjs)
          browser.goto(web_url)
          sleep 1
          document = Nokogiri::HTML(browser.html)
          while document.css('#asksTotal').text.empty?
            sleep 1
            p "add 1 sec to parse' pair #{key}"
            document = Nokogiri::HTML(browser.html)
          end
          browser.close
          Exchange.create(ex_type: key,
                          name: key.gsub('BTC_', ''),
                          last_price: value['last'],
                          percent_change: ((value['percentChange']).to_f * 100).round(2),
                          high24hr: value['high24hr'],
                          low24hr: value['low24hr'],
                          sell_orders: document.css('#asksTotal').text,
                          buy_orders: document.css('#bidsTotal').text,
                          count_in_btc: 1.00 / (value['last']).to_f)
        end
      end
    end
    threads.each(&:join)
  end

  def self.start
    time = Benchmark.measure do
      Plnx.new.create_exchanges
    end
    $time_load = time.real
  end
end
