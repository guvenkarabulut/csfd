class SearchController < ApplicationController
  def search
    @results = Post.search(params[:search])
    @results = Post.search('*') if params[:search].blank?
    render turbo_stream:
      turbo_stream.update('posts',
                          partial: 'posts/posts',
                          locals: { posts: @results })
  end
end
