class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :updated, :destroy]

  # POST /questions
  def create
    @question = Question.create!(question_params)
    render json: @question, status: :created
  end

  # GET /questions/:id
  def show
    render json: @question, status: :ok
  end

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions, status: :ok
  end

  # PUT /questions/:id
  # Maybe implement at a later date

  # DELETE /questions/:id
  def destroy
    @question.destroy
    head :no_content
  end

  private

  def set_question
    @question ||= Question.find(params[:id])
  end

  def question_params
    params.permit(:name, :user_id)
  end
end
