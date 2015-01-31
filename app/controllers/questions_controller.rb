class QuestionsController < ApplicationController
  before_action :require_authentication

  def create
    @question = current_user.questions.new(question_params)
    @question.save
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:place, :content)
  end
end
