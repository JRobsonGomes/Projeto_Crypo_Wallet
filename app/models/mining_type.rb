class MiningType < ApplicationRecord
    validates :description, :acronym, presence: true

    has_many :Coins, class_name: "Coin", foreign_key: "reference_id"
end
