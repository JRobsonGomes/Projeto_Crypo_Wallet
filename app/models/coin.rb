class Coin < ApplicationRecord
    belongs_to :mining_type#, class_name: "mining_type", foreign_key: "mining_type_id"
end
