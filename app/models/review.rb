class Review < ApplicationRecord
	validates :producttype, presence: true
	validates :storetype, presence: true

	belongs_to :store
	belongs_to :user
	has_many :labelinfos, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :reviewhighfives, dependent: :destroy

	PRODUCTTYPE = {
		'Flower': 'flower',
		'Concentrate': 'concentrate',
		'Edible': 'edible'
	}

	def inv_producttype
		PRODUCTTYPE.invert[self.producttype]
	end

	STORETYPE = {
		'Storefront': 'store',
		'Delivery Service': 'delivery'
	}

	def inv_storetype
		STORETYPE.invert[self.storetype]
	end

	STRAINTYPE = {
		'Sativa': 'sativa',
		'Indica': 'indica',
		'Hybrid': 'hybrid',
		'Hybrid - Sativa dominant': 'hybridsat',
		'Hybrid - Indica dominant': 'hybridind'
	}

	def inv_straintype
		STRAINTYPE.invert[self.straintype]
	end
end
