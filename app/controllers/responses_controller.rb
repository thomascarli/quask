class ResponsesController < ApiController
  before_action :require_login

  # POST /responses
  def create
    @response = Response.create!(response_params)
    render json: @response, status: :created
  end

  private

  def answer_params
    params.permit(:user_id, :answer_id)
  end
end
