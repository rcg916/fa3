class User < ApplicationRecord
	after_create :send_new_user_email
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :userlocations, dependent: :destroy
  has_many :favoritestores, dependent: :destroy
  has_many :photoupvotes, dependent: :destroy
  has_many :reviewhighfives, dependent: :destroy

  def send_new_user_email
  	GreetingMailer.user_signed_up(self).deliver_now
  end
 	
end
