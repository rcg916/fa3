class Store < ApplicationRecord
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode
	
	validates :storename, presence: true
	validates :address, presence: true

	has_many :reviews
end
