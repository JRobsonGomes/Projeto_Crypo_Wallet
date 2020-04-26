class MiningType < ApplicationRecord
    validates :description, :acronym, presence: true

    has_many :Coins, dependent: :destroy
end
