class User < ApplicationRecord
	has_many :reponses
	has_many :answers, through: :responses
	has_many :questions
end
