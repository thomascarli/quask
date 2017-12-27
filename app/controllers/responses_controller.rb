class ResponsesController < ApiController
  #before_action :require_login

  # POST /responses
  def create
    @response = Response.create!(response_params)
    render json: @response, status: :created
  end

  private

  def response_params
    params.require(:response).permit(:user_id, :answer_id)
  end
end
