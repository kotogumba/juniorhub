class Blog < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :blog_posts, dependent: :destroy
  has_many :blogs_tags, dependent: :destroy
  has_many :tags, through: :blogs_tags

end
