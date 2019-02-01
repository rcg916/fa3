class Photo < ApplicationRecord
	validates :picture, presence: true

	belongs_to :review

	mount_uploader :picture, PictureUploader
end
