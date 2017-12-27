class QuestionsController < ApiController

  before_action :set_question, only: [:show, :destroy]
  #before_action :require_login

  # POST /questions
  def create
    @question = Question.create!(question_params.merge({user_id: 1}))
    if question_params[:answers]
      question_params[:answers].with_indifferent_access.each do |answer|
        Answer.create!(name: answer[:name], question_id: @question.id)
      end
    end
    @question.prepare
    @question.broadcast
    render json: @question, status: :created
  end

  # GET /questions/:id
  def show
    render json: @question, status: :ok
  end

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions.order(created_at: :desc), status: :ok
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
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:name, :user_id, answers_attributes: [:name])
  end
end
