class Session < ApplicationRecord

    belongs_to :formation
    belongs_to :room

    has_many :attendences
    has_many :users, through: :attendences
end
