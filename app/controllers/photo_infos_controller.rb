class PhotoInfosController < ApplicationController
  include OAuthHelper
  before_action :login?, only: [:show, :new]

  def new   
    @photo = Photo.new   
  end 

  def create
    upload_file_name = nil
    # アップロードファイル
    upload_file = file_upload_params[:attachment]
    if upload_file.present?
      # アップロードファイルの元の名前
      upload_file_name = upload_file.original_filename
      # プロフィール画像を保存するディレクトリー
      upload_dir = Rails.root.join("public", "user_upload_photos")
      # アップロードするファイルのフルパス
      upload_file_path = upload_dir + upload_file_name
      # アップロードファイルの書き込み
      File.binwrite(upload_file_path, upload_file.read)
    end
    
    @photo = Photo.new(file_upload_params)
    # バリデーションチェックに失敗する場合
    if @photo.invalid?
      render :new
    else
      # アップロードする画像ファイル名で保存する
      @photo.attachment = upload_file_name if upload_file_name.present?
      # ファイルの保存処理が成功する場合
      redirect_to photo_infos_path if @photo.save
    end
  end  

  def show
    @photos_to_tweet = Photo.where(user_id: current_user.id).order(id: :desc)  
    @oauth_login_url = get_login_url
  end

  private   
  def file_upload_params   
    params.require(:photo).permit(:title, :attachment).merge(user_id: current_user.id)  
  end   
end
