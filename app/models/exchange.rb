require 'csv'
class Exchange < ApplicationRecord

  REQUIRED_ATTR = %w[name last_price percent_change high24hr low24hr sell_orders buy_orders count_in_btc]

  enum ex_type: %i[BTC_BCN BTC_BELA BTC_BLK BTC_BTCD BTC_BTM BTC_BTS BTC_BURST BTC_CLAM BTC_DASH BTC_DGB BTC_DOGE
                    BTC_EMC2 BTC_FLDC BTC_FLO BTC_GAME BTC_GRC BTC_HUC BTC_LTC BTC_MAID BTC_OMNI BTC_NAUT BTC_NAV
                    BTC_NEOS BTC_NMC BTC_NOTE BTC_NXT BTC_PINK BTC_POT BTC_PPC BTC_RIC BTC_SJCX BTC_STR BTC_SYS BTC_VIA
                    BTC_XVC BTC_VRC BTC_VTC BTC_XBC BTC_XCP BTC_XEM BTC_XMR BTC_XPM BTC_XRP BTC_ETH BTC_SC BTC_BCY
                    BTC_EXP BTC_FCT BTC_RADS BTC_AMP BTC_DCR BTC_LSK BTC_LBC BTC_STEEM BTC_SBD BTC_ETC BTC_REP BTC_ARDR
                    BTC_ZEC BTC_STRAT BTC_NXC BTC_PASC BTC_GNT BTC_GNO USDT_BTC]
  # enum ex_type: %i[BTC_BCN BTC_BELA BTC_BLK BTC_BTCD BTC_BTM
  #                   BTC_NEOS BTC_NMC BTC_NOTE BTC_NXT BTC_PINK
  #                    BTC_POT BTC_PPC BTC_RIC BTC_SJCX BTC_STR
  #                 BTC_SYS BTC_BTS USDT_BTC]

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << REQUIRED_ATTR
      order(:name).each do |p|
        csv << [p.name, p.last_price, p.percent_change, p.high24hr, p.low24hr, (p.sell_orders.to_f).round, (p.buy_orders.to_f).round, (p.count_in_btc.to_f).round]
      end
    end
  end
end
