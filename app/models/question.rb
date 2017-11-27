# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  include QuestionStateMachine

  belongs_to :user
  has_many :answers
  accepts_nested_attributes_for :answers

  def self.squawk
    next_question = self.where(state: "on_deck").first
    on_deck_question = self.where(state: "pending").first

    next_question.broadcast if next_question
    on_deck_question.prepare if on_deck_question
  end

end
