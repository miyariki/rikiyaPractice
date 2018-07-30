class TestsController < ApplicationController
 
  def index
  end
  
  #ユーザの一覧をjson形式で返すアクション
  def ajax_test
    puts "ok"
    @user = User.all
    render json: @user
  end
end
