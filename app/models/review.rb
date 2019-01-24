class Review < ApplicationRecord
	validates :producttype, presence: true

	belongs_to :store
	belongs_to :user
end
