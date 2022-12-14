class BlogPostCategory < ApplicationRecord
  belongs_to :blog_post
  belongs_to :category
end
