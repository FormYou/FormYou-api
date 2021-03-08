class Formation < ApplicationRecord
    belongs_to :user

    has_many :sessions

    has_many :assignement_categories
    has_many :categories, through: :assignement_categories
end
