class TwitterController < ApplicationController
  include OAuthHelper
  
  URL = 'http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/api/tweets'
  
  def new
  end
  
  def create
    # @feedback = Feedback.new(twitter_params)
    # if @feedback.save
    token = get_access_token

    tweet_file_path = "http://localhost:3000/user_upload_photos/" + params[:photo_file_name] if params[:photo_file_name].present?
  
    if token
      # アクセストークンがすでに取得されている場合、ツイート
      record = {
        "text" => params[:title],
        "url" => tweet_file_path
       }
  
      response = token.post(URL, {:body => record.to_json, :headers => {'Authorization' => "Bearer #{token.token}", 'Content-Type' => 'application/json'}})
  
      redirect_to photo_infos_path
    else
      # アクセストークンが存在しない場合、写真一覧ページへ戻り、承認のやり直し
      redirect_to new_photo_infos_path
    end
  end
end
