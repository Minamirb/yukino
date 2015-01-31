class QuestionsController < ApplicationController
  def create
  	content = params[:question][:content]
    @question = Question.new
    @question.content = content
    @question.save
    redirect_to root_path
  end
end
