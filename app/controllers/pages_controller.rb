class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[admin_panel]
  def home
    @posts = Post.all.order(created_at: :desc).limit(2)
  end

  def admin_panel; end
end
