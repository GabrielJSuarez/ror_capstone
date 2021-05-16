class UsersController < ApplicationController
  def index
    @users = User.all.includes(picture_attachment: :blob)
  end

  def show
    @user = User.find(params[:id])
  end
end
