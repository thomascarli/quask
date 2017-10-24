# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
	has_secure_password
	has_secure_token
	
	has_many :responses
	has_many :answers, through: :responses
	has_many :questions

	validates :name, presence: true

	def invalidate_token
		self.update_columns(token: nil)
	end

	def self.valid_login?(email, password)
		user = find_by(email: email)
		if user && user.authenticate(password)
			user
		end
	end
end
