class User < ApplicationRecord
	has_many :user_tickets
	has_many :tickets, :through => :user_tickets
	validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
																								message: "only allows letters" }
	validates :phone, length: {minimum: 9, maximum: 12}, numericality: true
	validates :password, length: {minimum: 8, maximum: 12}

end
