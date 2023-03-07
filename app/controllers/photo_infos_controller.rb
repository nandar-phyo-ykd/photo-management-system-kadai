class PhotoInfosController < ApplicationController
  before_action :login?, only: [:show, :new]

  def new   
    @photo = Photo.new   
  end 

  def create
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
    if @photo.errors.any?
      render :new
    else
      redirect_to photo_infos_path if @photo.save
    end
  end  

  def show
  end

  private   
  def file_upload_params   
    params.require(:photo).permit(:title, :attachment).merge(user_id: current_user.id)  
  end   
end
