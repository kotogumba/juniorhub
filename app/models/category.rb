class Category < ApplicationRecord
  validates :name, presence: true
  has_many :blogs, through: :blog_posts
  has_many :blog_categories, dependent: :destroy
end
