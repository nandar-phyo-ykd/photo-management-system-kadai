class PhotoInfosController < ApplicationController
  before_action :already_login?, only: [:new, :create]
  before_action :login?, only: :show

  def new
  end

  def create
  end

  def show
  end
end
