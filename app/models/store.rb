class Store < ApplicationRecord
	validates :storename, presence: true
	validates :address, presence: true

	has_many :reviews
end
