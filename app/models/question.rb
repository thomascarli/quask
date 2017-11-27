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

  def squawk
    next_question = self.where(state: "on_deck").first
    on_deck_question = self.where(state: "pending").first

    if next_question
      next_question.broadcast
    else
      Question.create(user_id: 1, name: "0 Questions Bitch.").prepare.broadcast
    end

    on_deck_question.prepare if on_deck_question
  end

end
