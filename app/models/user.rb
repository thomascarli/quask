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
	has_many :reponses
	has_many :answers, through: :responses
	has_many :questions

	validates :name, presence: true
end
