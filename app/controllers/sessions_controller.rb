class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(login_params)
    if @user.invalid?
      render :new
    else
      login_user = User.find_by_user_id(login_params[:user_id])
      if login_user && login_user.authenticate(login_params[:password])
        session[:user_id] = login_user.id
        redirect_to photo_infos_path
      else
        @user.errors.add(:base, "ユーザーIDとパスワードが一致していません")
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to photo_infos_path
  end

  private   
  def login_params 
    params.require(:user).permit(:user_id, :password)
  end
end
