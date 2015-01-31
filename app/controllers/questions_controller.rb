class QuestionsController < ApplicationController
  before_action :require_authentication

  def index
    @questions = current_user.questions.order(:id)
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.save
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:place, :content)
  end
end
