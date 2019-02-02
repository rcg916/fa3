class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :userlocations, dependent: :destroy
  has_many :favoritestores, dependent: :destroy
  has_many :photoupvotes, dependent: :destroy
 	
end
