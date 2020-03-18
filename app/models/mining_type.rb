class MiningType < ApplicationRecord
  has_many :Coins, class_name: 'Coin', foreign_key: 'reference_id'
end
