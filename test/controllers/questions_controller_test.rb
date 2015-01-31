# -*- coding: utf-8 -*-
require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @auth = auths(:one)
    session[:auth_id] = @auth.id
  end

  test "on POST :create" do
    assert_difference("@auth.user.questions.reload.count") do
      post :create, question: {place: "大阪府日本橋", content: '美味しいラーメン屋はどこですか？ここですか？なんですか。'}
    end
    assert assigns(:question).place
    assert_redirected_to questions_path
  end
end
