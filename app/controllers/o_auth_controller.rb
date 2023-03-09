class OAuthController < ApplicationController
  include OAuthHelper

  # 認可コードからアクセストークンを取得
  def oauth_callback
    token = get_token_from_code params[:code]
    session[:access_token] = token.to_hash
    redirect_to photo_infos_path
  end
end
