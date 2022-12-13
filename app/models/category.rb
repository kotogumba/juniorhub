class Category < ApplicationRecord
  validates :name, presence: true
  has_many :blog_categories, dependent: :destroy
  has_many :blogs, through: :blog_categories
end
