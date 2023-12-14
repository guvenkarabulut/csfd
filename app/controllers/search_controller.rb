class SearchController < ApplicationController
  def search
    # TODO: Add search by tags
    # TODO: Add pagination to search results
    @results = Post.search(params[:search], order: { created_at: :desc })
    @results = Post.search('*', order: { created_at: :desc }) if params[:search].blank?
    render turbo_stream:
      turbo_stream.update('posts',
                          partial: 'posts/posts',
                          locals: { posts: @results })
  end
end
