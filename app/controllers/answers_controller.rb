class AnswerssController < ApplicationController

  # POST /questions/:question_id/answers
  def create
    @answer = Answer.create!(answer_params)
    Response.create(answer_id: @answer.id, user_id: params[:user_id]) unless user_generated_answer
    render json: @answer, status: :created
  end

  # GET /questions/:question_id/answers
  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers, status: :ok
  end

  private

  def answer_params
    params.permit(:question_id, :user_id, :name)
  end

  def user_generated_answer
    Question.find(params[:question_id]).user_id == params[:user_id]
  end
end
