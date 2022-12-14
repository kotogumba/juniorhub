class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :blog, optional: true
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one_attached :image
  has_many :blog_post_categories, dependent: :destroy
  has_many :categories, through: :blog_post_categories

end
