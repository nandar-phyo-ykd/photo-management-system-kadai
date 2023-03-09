module OAuthHelper
    CLIENT_ID = Rails.configuration.x.oauth.client_id
    CLIENT_SECRET = Rails.configuration.x.oauth.client_secret
    SITE = Rails.configuration.x.oauth.idp_url
    AUTHORIZE_URL = '/oauth/authorize'
    TOKEN_URL = '/oauth/token'
    SCOPES = ['write_tweet']
    REDIRECT_URI= Rails.configuration.x.oauth.redirect_uri

    # ログインURLの生成
    def get_login_url
      client = OAuth2::Client.new(CLIENT_ID,
                                  CLIENT_SECRET,
                                  site: SITE,
                                  authorize_url: AUTHORIZE_URL,
                                  token_url: TOKEN_URL,
                                  redirect_uri: REDIRECT_URI)
  
      login_url = client.auth_code.authorize_url(scope: SCOPES.join(' '))
    end
  
    # アクセストークン取得のための認可コードを送信
    def get_token_from_code(auth_code)
      client = OAuth2::Client.new(CLIENT_ID,
                                  CLIENT_SECRET,
                                  site: SITE,
                                  authorize_url: AUTHORIZE_URL,
                                  token_url: TOKEN_URL,
                                  redirect_uri: REDIRECT_URI)
  
      token = client.auth_code.get_token(auth_code,
                                          scope: SCOPES.join(' '))
    end
  
    # アクセストークンの取得
    def get_access_token
      # セッションから現在のアクセストークンハッシュを取得
      token_hash = session[:access_token]
  
      client = OAuth2::Client.new(CLIENT_ID,
                                  CLIENT_SECRET,
                                  site: SITE,
                                  authorize_url: AUTHORIZE_URL,
                                  token_url: TOKEN_URL)
  
      token = OAuth2::AccessToken.from_hash(client, token_hash)
  
      # アクセストークンが期限切れの場合、リフレッシュトークンからアクセストークンを取得
      if token.expired?
        new_token = token.refresh!
        session[:access_token] = new_token.to_hash
        access_token = new_token
      else
        access_token = token
      end
    end
  end