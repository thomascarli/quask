class AnswersController < ApiController
  #before_action :require_login

  # POST /questions/:question_id/answers
  def create
    @answer = Answer.create!(answer_params)
    render json: @answer, status: :created
  end

  # GET /questions/:question_id/answers
  def index
    @answers = Question.find(params[:question_id]).answers
    render json: @answers.map{|answer| {answer: answer, count: answer.response_count} }, status: :ok
  end

  private

  def answer_params
    params.permit(:question_id, :name)
  end
end
