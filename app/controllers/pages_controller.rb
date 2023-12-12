class PagesController < ApplicationController
  def home
    @posts = Post.all.order(created_at: :desc).limit(2)
  end
end
