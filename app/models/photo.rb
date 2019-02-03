class Photo < ApplicationRecord
	validates :picture, presence: true

	belongs_to :review
	has_many :photoupvotes, dependent: :destroy

	mount_uploader :picture, PictureUploader
end
