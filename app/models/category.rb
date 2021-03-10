class Category < ApplicationRecord
    has_many :assignement_categories
    has_many :formations, through: :assignement_categories

    validates :name, presence: true
end
