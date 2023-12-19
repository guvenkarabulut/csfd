class SearchController < ApplicationController
  def search
    @results = if params[:search].present?
                 Post.where('title LIKE ? OR content LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
                     .order(created_at: :desc)
                     .page(params[:page])
                     .per(5)
               else
                 Post.order(created_at: :desc)
                     .page(params[:page])
                     .per(5)
               end

    render partial: 'posts/posts', locals: { posts: @results }
  end

  def search_with_tag
    sanitized_tag = params[:commit].gsub(/[^a-zA-Z0-9\s]/, '')
    @results = Post.where('tag LIKE ?', "%#{sanitized_tag}%")
                   .order(created_at: :desc)
                   .page(params[:page])
                   .per(5)

    render partial: 'posts/posts', locals: { posts: @results }
  end
end
