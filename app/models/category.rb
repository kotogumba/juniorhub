class Category < ApplicationRecord
  validates :name, presence: true
  has_many :blog_categories, dependent: :destroy
  has_many :blogs, through: :blog_categories
  has_many :blog_post_categories, dependent: :destroy
  has_many :blog_posts, through: :blog_post_categories
end
