
require 'twitter'

class QuestionsController < ApplicationController
  before_action :require_authentication

  def index
    @questions = current_user.questions.order(:id)
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.save

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_KEY"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end

    tsubuyaki = @question.place + @question.content
    tweet = client.update(tsubuyaki)
    redirect_to questions_path

  end

  private
  def question_params
    params.require(:question).permit(:place, :content)
  end
end
