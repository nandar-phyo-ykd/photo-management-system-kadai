class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  include ApplicationHelper

  def new
  end

  def create
    flash.now[alert] ||= []
    user = User.find_by_user_id(params[:user_id])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to photo_info_path
    elsif params[:user_id].blank? || params[:password].blank?
      flash.now[alert] << 'ユーザーIDを入力してください' if params[:user_id].blank?
      flash.now[alert] << 'パスワードを入力してください' if params[:password].blank?
      render :new
    else
      flash.now[alert] << 'ユーザーIDとパスワードが一致していません'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to photo_info_path
  end
end
