class User < ApplicationRecord
	has_secure_password
	has_many :messages
	validates :username, presence: true, length: { minimum: 2, 
				maximum: 50 }, uniqueness: true

end