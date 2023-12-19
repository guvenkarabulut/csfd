class SearchController < ApplicationController
  def search
    @results = Post.search(params[:search], order: { created_at: :desc }, page: params[:page], per_page: 5)
    if params[:search].blank?
      @results = Post.search('*', order: { created_at: :desc }, page: params[:page], per_page: 5)
    end
    render turbo_stream:
      turbo_stream.update('posts',
                          partial: 'posts/posts',
                          locals: { posts: @results })
  end

  def search_with_tag
    @results = Post.search(params[:commit].gsub(/[^a-zA-Z0-9\s]/, ''), fields: [:tag], order: { created_at: :desc },
                                                                       page: params[:page], per_page: 5)
    render turbo_stream:
      turbo_stream.update('posts',
                          partial: 'posts/posts',
                          locals: { posts: @results })
  end
end
