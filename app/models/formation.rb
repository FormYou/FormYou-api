class Formation < ApplicationRecord
    belongs_to :user

    has_many :sessions

    has_many :assignement_categories
    has_many :categories, through: :assignement_categories


  #______VALIDATIONS______#
  
  validates :title, presence: true, length: { in: 6..20 }

  validates :description, presence: true, length: { in: 20..500 }
end
