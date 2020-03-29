class Coin < ApplicationRecord
    validates :description, :acronym, :url_image, presence: true

    belongs_to :mining_type, class_name: "MiningType", foreign_key: "mining_type_id"
end
