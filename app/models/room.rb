class Room < ApplicationRecord
    has_many :sessions

    validates :room_number, presence: true
end
