class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :formations

  has_many :attendences
  has_many :sessions, through: :attendences

end