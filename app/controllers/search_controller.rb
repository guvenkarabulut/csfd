class SearchController < ApplicationController
  def search
    @results = if params[:search].present?
                 Post.paginate(page: params[:page], per_page: 5).order('created_at DESC').where(
                   'title LIKE ? OR summary LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"
                 )
               else
                 Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
               end

    render turbo_stream:
  turbo_stream.update('posts',
                      partial: 'posts/posts',
                      locals: { posts: @results })
  end

  def search_with_tag
    sanitized_tag = params[:commit].gsub(/[^a-zA-Z0-9\s]/, '')

    @results = Post.paginate(page: params[:page], per_page: 5)
                   .order(created_at: :desc)
                   .where(tag: Post.tags[sanitized_tag.downcase.to_sym])

    render turbo_stream:
     turbo_stream.update('posts',
                         partial: 'posts/posts',
                         locals: { posts: @results })
  end
end
