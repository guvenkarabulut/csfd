class Post < ApplicationRecord
  searchkick
  has_rich_text :content
  has_one_attached :image
end
