class PagesController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user_role_is_admin!, only: %i[panel]

  def home
    @posts = Post.all.order(created_at: :desc).limit(2)
  end

  def panel
    @posts = if current_user.role == 'admin'
               Post.all
             else
               Post.where(user_id: current_user.id)
             end
  end
end
