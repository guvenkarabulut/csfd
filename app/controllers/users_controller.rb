class UsersController < ApplicationController
  before_action :set_user

  def set_user
    @user = User.find(params[:id])
  end
end
