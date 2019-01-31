class Userlocation < ApplicationRecord
	belongs_to :user

	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode

	validates :address, presence: true
end
