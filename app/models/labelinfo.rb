class Labelinfo < ApplicationRecord
	validates :harvestdate, presence: true
	validates :thcperc, presence: true
	validates :cbdperc, presence: true

	belongs_to :review
end
