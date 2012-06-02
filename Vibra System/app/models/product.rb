class Product < ActiveRecord::Base
  attr_accessible :cash_price, :discount_pct, :expiration, :num_pqt_fidelity, :num_sessions, :price
end
