class PagesController < ApplicationController
  POST_LIMIT = 3
  include ApplicationHelper

  before_action :authenticate_user_role_is_admin!, only: %i[panel]

  def home
    @posts = Post.all.order(created_at: :desc).limit(POST_LIMIT)
  end

  def panel
    @posts = if current_user.role == 'admin'
               Post.all
             else
               Post.where(user_id: current_user.id)
             end
  end
end
