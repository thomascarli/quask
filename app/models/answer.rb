class Answer < ApplicationRecord
  belongs_to :question
  has_many :responses
  has_many :users, through: :responses
end
